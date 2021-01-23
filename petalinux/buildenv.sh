#!/usr/bin/sh
# gcc
export PATH=/tools/Xilinx/Vitis/2020.2/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin/:$PATH
# bootgen etc.
export PATH=/tools/Xilinx/Vitis/2020.2/bin:$PATH

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-

# make xilinx_zynq_virt_defconfig
# make -j8

# make xilinx_zynq_defconfig
# make uImage UIMAGE_LOADADDR=0x8000
# make dtbs

# https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842473/Build+and+Modify+a+Rootfs
# mkimage -A arm -T ramdisk -C gzip -d arm_ramdisk.image.gz uramdisk.image.gz

# setenv ipaddr 192.168.1.10
# setenv gatewayip 192.168.1.1
# setenv netmask 255.255.255.0
# setenv serverip 192.168.1.1

# tftpboot 0 zynq-zc702.dtb
# tftpboot 8000 uImage
# tftpboot 1000000 uramdisk.image.gz
# bootm 8000 1000000 0
# sudo systemctl start dnsmasq