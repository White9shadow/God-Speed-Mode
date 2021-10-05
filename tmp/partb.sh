# GODSPEED BETA
# VERSION = v1.0 | STABLE
# DATE = 16-8-2021
# !/sbin/sh

busybox mount /sys

# Backup Original Battery Tweak

if [ ! -f /sys/class/power_supply/battery/current_max.partb ]; then
  cp /sys/class/power_supply/battery/current_max /sys/class/power_supply/battery/current_max.partb
fi

if [ ! -f /sys/class/power_supply/battery/constant_charge_current_max.partb ]; then
  cp /sys/class/power_supply/battery/constant_charge_current_max /sys/class/power_supply/battery/constant_charge_current_max.partb
fi

if [ ! -f /sys/class/power_supply/usb/current_max.partb ]; then
  cp /sys/class/power_supply/usb/current_max /sys/class/power_supply/usb/current_max.partb
fi

if [ ! -f /sys/class/power_supply/usb/hw_current_max.partb ]; then
  cp /sys/class/power_supply/usb/hw_current_max /sys/class/power_supply/usb/hw_current_max.partb
fi

if [ ! -f /sys/class/power_supply/usb/pd_current_max.partb ]; then
  cp /sys/class/power_supply/usb/pd_current_max /sys/class/power_supply/usb/pd_current_max.partb
fi

if [ ! -f /sys/class/power_supply/usb/ctm_current_max.partb ]; then
  cp /sys/class/power_supply/usb/ctm_current_max /sys/class/power_supply/usb/ctm_current_max.partb
fi

if [ ! -f /sys/class/power_supply/usb/sdp_current_max.partb ]; then
  cp /sys/class/power_supply/usb/sdp_current_max /sys/class/power_supply/usb/sdp_current_max.partb
fi

if [ ! -f /sys/class/qcom-battery/restricted_current.partb ]; then
  cp /sys/class/qcom-battery/restricted_current /sys/class/qcom-battery/restricted_current.partb
fi
