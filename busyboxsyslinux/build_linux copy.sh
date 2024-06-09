#!/bin/bash

set -e

apt update
apt upgrade -y
apt install wget bzip2 git vim make gcc libncurses-dev gcc-11 flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools tar xz-utils -y

BASEDIR=$(pwd)
KERNEL_VERSION="5.15.12"
KERNEL_ARCHIVE="linux-$KERNEL_VERSION.tar.xz"
KERNEL_DIR="linux-$KERNEL_VERSION"
if [ ! -f $KERNEL_ARCHIVE ]; then
  wget https://cdn.kernel.org/pub/linux/kernel/v5.x/$KERNEL_ARCHIVE
fi
if [ ! -d $KERNEL_DIR ]; then
  tar -xvf $KERNEL_ARCHIVE
fi
cd $KERNEL_DIR
make defconfig
make HOSTCC=gcc-11 CC=gcc-11 -j$(nproc)

mkdir -p /bootfiles
cp arch/x86/boot/bzImage /bootfiles/

cd $BASEDIR

BUSYBOX_VERSION="1.35.0"
BUSYBOX_ARCHIVE="busybox-$BUSYBOX_VERSION.tar.bz2"
BUSYBOX_DIR="busybox-$BUSYBOX_VERSION"
if [ ! -f $BUSYBOX_ARCHIVE ]; then
  wget https://busybox.net/downloads/$BUSYBOX_ARCHIVE
fi
if [ ! -d $BUSYBOX_DIR ]; then
  tar -xvf $BUSYBOX_ARCHIVE
fi

cd $BUSYBOX_DIR
make defconfig

sed -i 's/.*# CONFIG_STATIC .*/CONFIG_STATIC=y/' .config

make HOSTCC=gcc-11 CC=gcc-11 -j $(nproc)

mkdir -p /bootfiles/initramfs
make CONFIG_PREFIX=/bootfiles/initramfs install

cat <<EOF > /bootfiles/initramfs/init
#!/bin/sh
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t devtmpfs dev /dev
echo "Welcome to Minimal Linux"
exec /bin/sh
EOF

chmod +x /bootfiles/initramfs/init

cd /bootfiles/initramfs/
find . | cpio -o -H newc > ../init.cpio
cd /bootfiles
dd if=/dev/zero of=boot bs=1M count=50
mkfs -t fat boot
syslinux boot
mkdir -p m
mount boot m
cp bzImage init.cpio m/

cat <<EOF > m/syslinux.cfg
DEFAULT linux
LABEL linux
    SAY Now booting the kernel from Syslinux...
    KERNEL bzImage
    INITRD init.cpio
    APPEND root=/dev/ram0
EOF

umount m

cp boot /output/
