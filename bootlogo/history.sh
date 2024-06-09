apt update
apt install wget bzip2 git vim make gcc libncurses-dev gcc-11 flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools tar xz-utils -y
BUSYBOX_VERSION="1.35.0"
BUSYBOX_ARCHIVE="busybox-$BUSYBOX_VERSION.tar.bz2"
BUSYBOX_DIR="busybox-$BUSYBOX_VERSION"
wget https://busybox.net/downloads/$BUSYBOX_ARCHIVE
tar -xvf $BUSYBOX_ARCHIVE
cd busybox-1.35.0
make defconfig
grep static .config
grep STATIC .config
sed -i 's/.*# CONFIG_STATIC .*/CONFIG_STATIC=y/' .config
grep STATIC .config
cd
apt install bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc make libtool git vim libpng-dev libfreetype-dev g++ extlinux .y
apt install bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc make libtool git vim libpng-dev libfreetype-dev g++ extlinux -y
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.9.3.tar.xz
tar xf linux-6.9.3.tar.xz
cd linux-6.9.3
ls
make defconfig
cp .config .config.alt
make menuconfig
make -j$(nproc)
diff
diff .config .config.alt
diff .config.alt .config
diff .config .config.alt
clear
diff .config .config.alt
mkdir distro
cp arch/x86/boot/bzImage distro/
mkdir /distro
cp arch/x86/boot/bzImage /distro
cd
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar xf busybox-1.36.1.tar.bz2
cd busybox-1.36.1
make defconfig
cp .config .config.alt
make menuconfig
diff .config .config.old
diff .config .config.alt
make CONFIG_PREFIX=/distro install
make -j$(nproc)
make CONFIG_PREFIX=/distro install
git
git https://github.com/ghaerr/microwindows
git clone https://github.com/ghaerr/microwindows
cd ..
git clone https://github.com/ghaerr/microwindows
cd microwindows/
ls
cd src/
cp Configs/config.linux-fb config
make -j$(nproc)
nano
vi config
make -j$(nproc)
vi nx11/Makefile
make -j$(nproc)
vi nx11/Makefile
make -j$(nproc)
cd ../..
mkdir x11demo
cd x11demo/
nano gui.c
nano gui.c
vi gui.c
vi gui.c
vi gui.c
wget https://gist.githubusercontent.com/nir9/098d83c754460540ec6050f7f8d7ffb6/raw/f667c2d15aeda13b93c65aa12c50d7d42602ac13/gui.c
ls
vi gui.c
gcc gui.c -lNX11 -lnano-X -i
cd
cd microwindows/src/
ls
make install
cd
cd x11demo/
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
ls
mv a.out /distro/test-app
cd ..
cd microwindows/
ls
cd src/
cd bin/
ls
ldd nano-X
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
cd ..
cp -r bin /distro/nanox/
vi /distro/nanox/runapp
cd /distro/
truncate -s 200MB boot.img
mkfs boot.img
mkdir mnt
mount boot.img mnt
extlinux -i mnt
extlinux -i mnt/
mv bin bzImage lib lib64 linuxrc nanox/ test-app sbin/ usr/ mnt
cp bin bzImage lib lib64 linuxrc nanox/ test-app sbin/ usr/ mnt
cd mnt/
mkdir var etc root tmp dev proc
cd ..
umount mnt
uname
hostname
ls
history -w
cd
cat .bash_history
cd
ls
cd linux-6.9.3
make defconfig
make menuconfig
diff .config .config.old
diff .config.old .config
make menuconfig
make -j$(nproc)
mkdir /distro
cp arch/x86/boot/bzImage /distro
cd ..
cd busybox-1.36.1
make menuconfig
make -j$(nproc)
make CONFIG_PREFIX=/distro install
cd
ls
rm -r microwindows
git clone https://github.com/ghaerr/microwindows
cd microwindows/
cd src/
cp Configs/config.linux-fb config
vi config
vi config
vi config
vi config
vi nx11/Makefile
make -j$(nproc)
make install
cd
ls
cd x11demo/
ls
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
vp a.out /distro/testapp
cp a.out /distro/testapp
cd
cd microwindows/src/bin/
cp /lib/x86_64-linux-gnu/libpng16.so.16 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libz.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libfreetype.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libc.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libm.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlidec.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlicommon.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib64/ld-linux-x86-64.so.2 /distro/lib64/
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
cd ..
cp -r bin /distro/nanox
co runapp /distro/nanox
cp runapp /distro/nanox
truncate -s 200MB boot.img
mkfs boot.img
cd /distro/
truncate -s 200MB boot.img
mkfs boot.img
mkdir mnt
mount boot.img mnt
extlinux -i mnt
cp bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cp -r bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cd mnt
ls
mkdir var etc root tmp dev proc
cd ..
umount
cd
cd linux-6.9.3
ls
make menuconfig
makemake -j$(nproc)
make -j$(nproc)
cp arch/x86/boot/bzImage /distro
cp arch/x86/boot/bzImage /distro/
history -w

BUSYBOX_VERSION="1.35.0"
BUSYBOX_ARCHIVE="busybox-$BUSYBOX_VERSION.tar.bz2"
BUSYBOX_DIR="busybox-$BUSYBOX_VERSION"
wget https://busybox.net/downloads/$BUSYBOX_ARCHIVE
tar -xvf $BUSYBOX_ARCHIVE
cd busybox-1.35.0
make defconfig
grep static .config 
grep STATIC .config 
sed -i 's/.*# CONFIG_STATIC .*/CONFIG_STATIC=y/' .config
grep STATIC .config 
cd 
apt install bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc make libtool git vim libpng-dev libfreetype-dev g++ extlinux .y
apt install bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc make libtool git vim libpng-dev libfreetype-dev g++ extlinux -y
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.9.3.tar.xz
tar xf linux-6.9.3.tar.xz 
cd linux-6.9.3
ls
make defconfig
cp .config .config.alt
make menuconfig
make -j$(nproc)
diff
diff .config .config.alt 
diff .config.alt .config
diff .config .config.alt
clear
diff .config .config.alt
mkdir distro
cp arch/x86/boot/bzImage distro/
mkdir /distro
cp arch/x86/boot/bzImage /distro
cd
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar xf busybox-1.36.1.tar.bz2 
cd busybox-1.36.1
make defconfig
cp .config .config.alt
make menuconfig
diff .config .config.old 
diff .config .config.alt 
make CONFIG_PREFIX=/distro install
make -j$(nproc)
make CONFIG_PREFIX=/distro install
git
git https://github.com/ghaerr/microwindows
git clone https://github.com/ghaerr/microwindows
cd ..
git clone https://github.com/ghaerr/microwindows
cd microwindows/
ls
cd src/
cp Configs/config.linux-fb config
make -j$(nproc)
nano 
vi config 
make -j$(nproc)
vi nx11/Makefile 
make -j$(nproc)
vi nx11/Makefile 
make -j$(nproc)
cd ../..
mkdir x11demo
cd x11demo/
nano gui.c
nano gui.c
vi gui.c
vi gui.c
vi gui.c
wget https://gist.githubusercontent.com/nir9/098d83c754460540ec6050f7f8d7ffb6/raw/f667c2d15aeda13b93c65aa12c50d7d42602ac13/gui.c
ls
vi gui.c 
gcc gui.c -lNX11 -lnano-X -i 
cd 
cd microwindows/src/
ls
make install
cd
cd x11demo/
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
ls
mv a.out /distro/test-app
cd ..
cd microwindows/
ls
cd src/
cd bin/
ls
ldd nano-X
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
cd ..
cp -r bin /distro/nanox/
vi /distro/nanox/runapp
cd /distro/
truncate -s 200MB boot.img
mkfs boot.img 
mkdir mnt
mount boot.img mnt
extlinux -i mnt
extlinux -i mnt/
mv bin bzImage lib lib64 linuxrc nanox/ test-app sbin/ usr/ mnt
cp bin bzImage lib lib64 linuxrc nanox/ test-app sbin/ usr/ mnt
cd mnt/
mkdir var etc root tmp dev proc
cd ..
umount mnt
uname
hostname
ls
history -w
cd
cat .bash_history 
cd
ls
cd linux-6.9.3
make defconfig
make menuconfig
diff .config .config.old 
diff .config.old .config 
make menuconfig
make -j$(nproc)
mkdir /distro
cp arch/x86/boot/bzImage /distro
cd ..
cd busybox-1.36.1
make menuconfig
make -j$(nproc)
make CONFIG_PREFIX=/distro install
cd
ls
rm -r microwindows
git clone https://github.com/ghaerr/microwindows
cd microwindows/
cd src/
cp Configs/config.linux-fb config
vi config
vi config
vi config
vi config
vi nx11/Makefile 
make -j$(nproc)
make install
cd
ls
cd x11demo/
ls
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
vp a.out /distro/testapp
cp a.out /distro/testapp
cd 
cd microwindows/src/bin/
cp /lib/x86_64-linux-gnu/libpng16.so.16 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libz.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libfreetype.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libc.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libm.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlidec.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlicommon.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib64/ld-linux-x86-64.so.2 /distro/lib64/
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
cd ..
cp -r bin /distro/nanox
co runapp /distro/nanox
cp runapp /distro/nanox
truncate -s 200MB boot.img
mkfs boot.img 
cd /distro/
truncate -s 200MB boot.img
mkfs boot.img 
mkdir mnt
mount boot.img mnt
extlinux -i mnt
cp bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cp -r bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cd mnt
ls
mkdir var etc root tmp dev proc
cd ..
umount 
cd
cd linux-6.9.3
ls
make menuconfig
makemake -j$(nproc)
make -j$(nproc)
cp arch/x86/boot/bzImage /distro
cp arch/x86/boot/bzImage /distro/
history -w
apt update
apt install wget bzip2 git vim make gcc libncurses-dev gcc-11 flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools tar xz-utils -y
BUSYBOX_VERSION="1.35.0"
BUSYBOX_ARCHIVE="busybox-$BUSYBOX_VERSION.tar.bz2"
BUSYBOX_DIR="busybox-$BUSYBOX_VERSION"
wget https://busybox.net/downloads/$BUSYBOX_ARCHIVE
tar -xvf $BUSYBOX_ARCHIVE
cd busybox-1.35.0
make defconfig
grep static .config 
grep STATIC .config 
sed -i 's/.*# CONFIG_STATIC .*/CONFIG_STATIC=y/' .config
grep STATIC .config 
cd 
apt install bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc make libtool git vim libpng-dev libfreetype-dev g++ extlinux .y
apt install bzip2 libncurses-dev flex bison bc libelf-dev libssl-dev xz-utils autoconf gcc make libtool git vim libpng-dev libfreetype-dev g++ extlinux -y
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.9.3.tar.xz
tar xf linux-6.9.3.tar.xz 
cd linux-6.9.3
ls
make defconfig
cp .config .config.alt
make menuconfig
make -j$(nproc)
diff
diff .config .config.alt 
diff .config.alt .config
diff .config .config.alt
clear
diff .config .config.alt
mkdir distro
cp arch/x86/boot/bzImage distro/
mkdir /distro
cp arch/x86/boot/bzImage /distro
cd
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar xf busybox-1.36.1.tar.bz2 
cd busybox-1.36.1
make defconfig
cp .config .config.alt
make menuconfig
diff .config .config.old 
diff .config .config.alt 
make CONFIG_PREFIX=/distro install
make -j$(nproc)
make CONFIG_PREFIX=/distro install
git
git https://github.com/ghaerr/microwindows
git clone https://github.com/ghaerr/microwindows
cd ..
git clone https://github.com/ghaerr/microwindows
cd microwindows/
ls
cd src/
cp Configs/config.linux-fb config
make -j$(nproc)
nano 
vi config 
make -j$(nproc)
vi nx11/Makefile 
make -j$(nproc)
vi nx11/Makefile 
make -j$(nproc)
cd ../..
mkdir x11demo
cd x11demo/
nano gui.c
nano gui.c
vi gui.c
vi gui.c
vi gui.c
wget https://gist.githubusercontent.com/nir9/098d83c754460540ec6050f7f8d7ffb6/raw/f667c2d15aeda13b93c65aa12c50d7d42602ac13/gui.c
ls
vi gui.c 
gcc gui.c -lNX11 -lnano-X -i 
cd 
cd microwindows/src/
ls
make install
cd
cd x11demo/
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
ls
mv a.out /distro/test-app
cd ..
cd microwindows/
ls
cd src/
cd bin/
ls
ldd nano-X
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
cd ..
cp -r bin /distro/nanox/
vi /distro/nanox/runapp
cd /distro/
truncate -s 200MB boot.img
mkfs boot.img 
mkdir mnt
mount boot.img mnt
extlinux -i mnt
extlinux -i mnt/
mv bin bzImage lib lib64 linuxrc nanox/ test-app sbin/ usr/ mnt
cp bin bzImage lib lib64 linuxrc nanox/ test-app sbin/ usr/ mnt
cd mnt/
mkdir var etc root tmp dev proc
cd ..
umount mnt
uname
hostname
ls
history -w
cd
cat .bash_history 
cd
ls
cd linux-6.9.3
make defconfig
make menuconfig
diff .config .config.old 
diff .config.old .config 
make menuconfig
make -j$(nproc)
mkdir /distro
cp arch/x86/boot/bzImage /distro
cd ..
cd busybox-1.36.1
make menuconfig
make -j$(nproc)
make CONFIG_PREFIX=/distro install
cd
ls
rm -r microwindows
git clone https://github.com/ghaerr/microwindows
cd microwindows/
cd src/
cp Configs/config.linux-fb config
vi config
vi config
vi config
vi config
vi nx11/Makefile 
make -j$(nproc)
make install
cd
ls
cd x11demo/
ls
gcc gui.c -lNX11 -lnano-X -I ~/microwindows/src/nx11/X11-local/
vp a.out /distro/testapp
cp a.out /distro/testapp
cd 
cd microwindows/src/bin/
cp /lib/x86_64-linux-gnu/libpng16.so.16 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libz.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libfreetype.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libc.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libm.so.6 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlidec.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib/x86_64-linux-gnu/libbrotlicommon.so.1 /distro/lib/x86_64-linux-gnu/
cp /lib64/ld-linux-x86-64.so.2 /distro/lib64/
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
cd ..
cp -r bin /distro/nanox
co runapp /distro/nanox
cp runapp /distro/nanox
truncate -s 200MB boot.img
mkfs boot.img 
cd /distro/
truncate -s 200MB boot.img
mkfs boot.img 
mkdir mnt
mount boot.img mnt
extlinux -i mnt
cp bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cp -r bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cd mnt
ls
mkdir var etc root tmp dev proc
cd ..
umount 
cd
cd linux-6.9.3
ls
make menuconfig
makemake -j$(nproc)
make -j$(nproc)
cp arch/x86/boot/bzImage /distro
cp arch/x86/boot/bzImage /distro/
history -w
cat ~/.bash_history 
cd /distro/
mount boot.img mnt
extlinux -i mnt
cp -r bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
cd mnt/
mkdir var etc root tmp dev proc
ls
mkdir boot 
cd boot/
ls
vi extlinux.conf
vi extlinux.conf
cd ..
cd ..
umount mnt
mount
ls
mount boot.img mnt/
cd mnt/
ls
cp boot/extlinux.conf .
cd ..
umount mnt
cd mnt/
ls
cd ..
cd
sl
ls
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.7.4.tar.xz
tar -xf linux-6.7.4.tar.xz 
cd linux-6.7.4.tar.xz 
cd linux-6.7.4
ls
make menuconfig
make menuconfig
make -j24
cp arch/x86/boot/bzImage /distro/
cd /distro/
mount boot.img mnt/
cp -r bin bzImage lib lib64 linuxrc nanox/ testapp sbin/ usr/ mnt
umount boot.img 
mount boot.img mnt/
cd mnt/
ls
vi extlinux.conf 
cd ..
ls
cd nanox/
ls
ls runapp 
cd /distro/
nano linuxrc 
vi linuxrc 
cd
cd linux-6.7.4
ls
vi .config
ls
cd
ls
cd /distro/
ls
cd mnt/
ls
vi extlinux.conf 
cd ..
ls
umount mnt
mount boot.img mnt/
ls
cd mnt/
ls
nano extlinux.conf 
vi extlinux.conf 
cd ..
umount boot.img 
mount boot.img mnt/
cd mnt/
vi extlinux.conf 
cd ..
umount mnt
exit


2942c2942
< # CONFIG_FB_CIRRUS is not set
---
> CONFIG_FB_CIRRUS=y