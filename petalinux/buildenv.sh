#!/usr/bin/sh
# gcc
export PATH=/tools/Xilinx/Vitis/2020.2/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin/:$PATH
# bootgen etc.
export PATH=/tools/Xilinx/Vitis/2020.2/bin:$PATH

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-