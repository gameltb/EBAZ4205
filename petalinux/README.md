build u-boot

```shell
cd u-boot-xlnx
make xilinx_zynq_virt_defconfig
make -j8
```

build linux & dtb

```shell
cd linux-xlnx
make xilinx_zynq_defconfig
make uImage UIMAGE_LOADADDR=0x8000 -j8
make dtbs
```

rootfs

```shell
# https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842473/Build+and+Modify+a+Rootfs
mkimage -A arm -T ramdisk -C gzip -d arm_ramdisk.image.gz uramdisk.image.gz
```

u-boot tftp

```
setenv ipaddr 192.168.1.10
setenv gatewayip 192.168.1.1
setenv netmask 255.255.255.0
setenv serverip 192.168.1.1
```

host use dnsmasq

- https://wiki.archlinux.org/index.php/Dnsmasq#TFTP_server

```
sudo systemctl start dnsmasq
```

u-boot tftp boot

```
tftpboot 0 zynq-EBAZ4205.dtb
tftpboot 8000 uImage
tftpboot 1000000 uramdisk.image.gz
bootm 8000 1000000 0
```

u-boot nfs root

```
tftpboot 0 zynq-EBAZ4205.dtb
tftpboot 8000 uImage
```

set bootargs

```shell
# normal
setenv bootargs root=/dev/nfs ip=192.168.1.10 nfsroot=192.168.1.1:/srv/nfs4/rootfs,proto=tcp,v3 rw console=ttyPS0,115200
# not require password
setenv bootargs root=/dev/nfs ip=192.168.1.10 nfsroot=192.168.1.1:/srv/nfs4/rootfs,proto=tcp,v3 rw console=ttyPS0,115200 init=/bin/bash
```

start nfs

- https://wiki.archlinux.org/index.php/NFS

```
sudo systemctl start nfs-server
```

u-boot boot

```
bootm 8000 - 0
```

set ip in linux

```shell
ifconfig eth0 192.168.1.10/24
ip ro add default via 192.168.1.1 dev eth0
```

nfs /etc/exports

```
/srv/nfs/rootfs    192.168.1.0/24(rw,sync,no_root_squash,fsid=0)
```
