#!/bin/bash

DEFCONFIG=a71_defconfig

# Declare your CLANG n GCC Location HERE!
CLANG_PATH=~/Android/clang/proton-clang
#GCC_PATH=~/Android/gcc/aarch64-linux-android-4.9

# export ANDROID_MAJOR_VERSION=q

make O=out ARCH=arm64 $DEFCONFIG

PATH="$CLANG_PATH/bin:${PATH}" \
                      make -j1 O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      AR=llvm-ar \
                      NM=llvm-nm \
                      OBJCOPY=llvm-objcopy \
                      OBJDUMP=llvm-objdump \
                      STRIP=llvm-strip
