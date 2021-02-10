connect
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
fpga -file ../EBAZ4205/EBAZ4205_wrapper.bit
loadhw -hw ../EBAZ4205/EBAZ4205_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
source ../EBAZ4205/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow ../petalinux/u-boot-xlnx/u-boot.elf
configparams force-mem-access 0
con