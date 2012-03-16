#!/system/bin/bash
#

disk_size=24480 #default 24480 (25%). Range: 0 - ~97932, larger number = less 'normal' RAM, more 'swap' RAM
swappy=60 #swappiness. Range: 0 - 100, larger number = more likely to swap

modprobe ramzswap;
rzscontrol /dev/block/ramzswap0 --disksize_kb=$disk_size --init;
swapon /dev/block/ramzswap0;
sysctl -w vm.swappiness=$swappy;

exit 0;

