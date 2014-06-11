#!/bin/sh
# Basics script for power saving in GNU+linux.

# Laptop mode
echo 5 > /proc/sys/vm/laptop_mode
# Swap
echo 2 > /proc/sys/vm/swappiness
#Kill Wathdog
echo 0 > /proc/sys/kernel/nmi_watchdog
# VM disk activity
echo 6000 > /proc/sys/vm/dirty_writeback_centisecs
echo 6000 > /proc/sys/vm/dirty_expire_centisecs
# Intel power saving
echo Y > /sys/module/snd_hda_intel/parameters/power_save_controller
echo 1 > /sys/module/snd_hda_intel/parameters/power_save
# Backlight brightness 
echo 4 > /sys/class/backlight/acpi_video0/brightness
# USB powersaving
for i in /sys/bus/usb/devices/*/power/autosuspend; do
echo 1 > $i
done
# SATA power saving
for i in /sys/class/scsi_host/host*/link_power_management_policy; do
echo min_power > $i
done

exit 0
