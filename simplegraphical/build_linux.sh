#!/bin/bash
apt update
apt install wget bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc gcc-11 make libtool git vim libpng-dev libfreetype-dev g++ extlinux -y

KERNEL_VERSION="5.10.17"
KERNEL_ARCHIVE="linux-$KERNEL_VERSION.tar.xz"
KERNEL_DIR="linux-$KERNEL_VERSION"
if [ ! -f $KERNEL_ARCHIVE ]; then
  wget https://cdn.kernel.org/pub/linux/kernel/v5.x/$KERNEL_ARCHIVE
fi
if [ ! -d $KERNEL_DIR ]; then
  tar -xf $KERNEL_ARCHIVE
fi
cd $KERNEL_DIR

rm .config
echo KERNEL configuration
make HOSTCC=gcc-11 CC=gcc-11 defconfig 1> /dev/null
CONFIG_FILE=".config"
#cp /.config .config
sed -i 's/# CONFIG_DRM_CIRRUS_QEMU is not set/CONFIG_DRM_CIRRUS_QEMU=y/' "$CONFIG_FILE"
sed -i '/# CONFIG_FB is not set/c\
CONFIG_FB=y\
CONFIG_FB_CIRRUS=y\
CONFIG_FB_CORE=y\
CONFIG_FB_NOTIFY=y\
# CONFIG_FIRMWARE_EDID is not set\
CONFIG_FB_DEVICE=y\
CONFIG_FB_CFB_FILLRECT=y\
CONFIG_FB_CFB_COPYAREA=y\
CONFIG_FB_CFB_IMAGEBLIT=y\
# CONFIG_FB_FOREIGN_ENDIAN is not set\
CONFIG_FB_IOMEM_FOPS=y\
# CONFIG_FB_MODE_HELPERS is not set\
# CONFIG_FB_TILEBLITTING is not set' "$CONFIG_FILE"
sed -i '/# CONFIG_FRAMEBUFFER_CONSOLE is not set/a\
CONFIG_LOGO=y\
CONFIG_LOGO_LINUX_MONO=y\
CONFIG_LOGO_LINUX_VGA16=y\
CONFIG_LOGO_LINUX_CLUT224=y' "$CONFIG_FILE"
sed -i '/# CONFIG_INPUT_MOUSEDEV is not set/c\
CONFIG_INPUT_MOUSEDEV=y\
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set\
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024\
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768' .config
echo kernel compilation
make HOSTCC=gcc-11 CC=gcc-11 -j$(nproc) > /dev/null
mkdir -p /distro/
cp arch/x86/boot/bzImage /distro  2> /dev/null

cd
BUSYBOX_VERSION="1.36.1"
BUSYBOX_ARCHIVE="busybox-$BUSYBOX_VERSION.tar.bz2"
BUSYBOX_DIR="busybox-$BUSYBOX_VERSION"
if [ ! -f $BUSYBOX_ARCHIVE ]; then
  wget https://busybox.net/downloads/$BUSYBOX_ARCHIVE
fi
if [ ! -d $BUSYBOX_DIR ]; then
  tar -xf $BUSYBOX_ARCHIVE
fi

cd $BUSYBOX_DIR
rm .config
echo BUSYBOX configuration
make HOSTCC=gcc-11 CC=gcc-11 defconfig
sed -i 's/.*# CONFIG_STATIC .*/CONFIG_STATIC=y/' .config
echo BUSYBOX compile
make HOSTCC=gcc-11 CC=gcc-11 -j$(nproc)
echo BUSYBOX install
make HOSTCC=gcc-11 CC=gcc-11 CONFIG_PREFIX=/distro install

cd
git clone https://github.com/ghaerr/microwindows
cd microwindows/src
cp Configs/config.linux-fb config
sed -i 's/^NX11[[:space:]]*= N/NX11                     = Y/' config
CONFIG_FILE="nx11/Makefile"
sed -i 's/^X11_INCLUDE=$(X11HDRLOCATION)/#X11_INCLUDE=$(X11HDRLOCATION)/' "$CONFIG_FILE"
sed -i 's/^#X11_INCLUDE=\.\/X11-local/X11_INCLUDE=\.\/X11-local/' "$CONFIG_FILE"
make HOSTCC=gcc-11 CC=gcc-11 -j$(nproc)
make HOSTCC=gcc-11 CC=gcc-11 install
mkdir -p /distro/nanox/
cp -r bin/* /distro/nanox/
cp runapp /distro/nanox/

mkdir /distro/lib/x86_64-linux-gnu/
mkdir -p /distro/lib/x86_64-linux-gnu/
mkdir -p /distro/lib64/
cp /lib/x86_64-linux-gnu/libpng16.so.16 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libz.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libfreetype.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libc.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libm.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlidec.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlicommon.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib64/ld-linux-x86-64.so.2 /distro/lib64/


cd
mkdir -p testapp
wget https://gist.githubusercontent.com/nir9/098d83c754460540ec6050f7f8d7ffb6/raw/f667c2d15aeda13b93c65aa12c50d7d42602ac13/gui.c
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
mv a.out /distro/testapp



cd /distro
truncate -s 200MB boot.img
mkfs boot.img
mkdir -p mnt
mount boot.img mnt
extlinux -i mnt
cp bzImage mnt/
cp -r bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cd mnt
cat <<EOF > extlinux.conf
DEFAULT linux
LABEL linux
    KERNEL bzImage
    APPEND root=/dev/sda rw
    
EOF

mkdir -p var etc mnt root tmp dev proc

mkdir -p etc/init.d/
cat <<EOF > etc/init.d/rcS_
#!/bin/sh
cd /nanox
./nano-X &
launcher launcher.cnf
/testapp
exec /bin/sh
EOF
chmod +x etc/init.d/rcS_

cat <<EOF > etc/inittab
tty1::respawn:/bin/sh etc/init.d/rcS_
tty2::respawn:-/bin/sh
tty3::respawn:-/bin/sh
tty4::respawn:-/bin/sh
EOF

cd ..
umount mnt
cp boot.img /output/
echo DONE 