connect
targets -set -nocase -filter {name =~"APU*"}
rst -processor -stop -clear-registers
after 3000
configparams force-mem-access 1
source ../EBAZ4205/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow ../petalinux/u-boot-xlnx/u-boot.elf
configparams force-mem-access 0
con