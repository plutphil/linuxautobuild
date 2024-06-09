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

sed -i '/# CONFIG_FRAMEBUFFER_CONSOLE is not set/a\
CONFIG_LOGO=y\
CONFIG_LOGO_LINUX_MONO=y\
CONFIG_LOGO_LINUX_VGA16=y\
CONFIG_LOGO_LINUX_CLUT224=y' "$CONFIG_FILE"
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
cd ..
umount mnt
cp boot.img /output/
echo DONE 