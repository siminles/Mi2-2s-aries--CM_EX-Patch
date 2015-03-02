#!/bin/bash


# set toolchain
export ARCH=arm
#export CROSS_COMPILE=/home/simin/gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux/bin/arm-linux-gnueabihf-
export CROSS_COMPILE=/home/simin/gcctools/gcc-a15/arm-cortex_a15-linux-gnueabihf-linaro_4.9/bin/arm-cortex_a15-linux-gnueabihf-

#export CROSS_COMPILE=/home/simin/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf-

# make zImage
mkdir -p ./out/done/modules/
# make O=./out cyanogen_ex_aries_defconfig
make O=./out cyanogen_aries_defconfig
make -j8 O=./out

# Copy Kernel Image and Modules
if [ $? -eq 0 ]
then
	echo "==================================="
	echo "          Compile success!"
	echo "==================================="
	cd out
	cp -f ./arch/arm/boot/zImage ./done/
	cp -r `find -iname '*.ko'` ./done/modules/
	cd -
else
	echo "==================================="
	echo "          Compile failed!"
	echo "==================================="
fi
