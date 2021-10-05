# GODSPEED STABLE
# VERSION = v3.0.1 | STABLE
# DATE = 16-8-2021
# !/system/bin/sh

target=`getprop ro.board.platform`

# Enable Fast Charging Twewks Set Config
echo 1 > /sys/kernel/fast_charge/force_fast_charge

# Fast Charging Tweaks Set Config
echo 2000 > /sys/module/qpnp_smbcharger/parameters/default_dcp_icl_ma
echo 1800 > /sys/module/qpnp_smbcharger/parameters/default_hvdcp_icl_ma
echo 2400 > /sys/module/qpnp_smbcharger/parameters/default_hvdcp3_icl_ma
echo 1800 > /sys/module/dwc3_msm/parameters/hvdcp_max_current
echo 2000 > /sys/module/dwc3_msm/parameters/dcp_max_current
echo 2000 > /sys/module/phy_msm_usb/parameters/dcp_max_current
echo 1800 > /sys/module/phy_msm_usb/parameters/hvdcp_max_current

#Quick Charge 3.0 Specific settings:
#Battery Maximum charging current, just a initial value.
echo 140 > /sys/class/power_supply/bms/temp_cool
echo 460 > /sys/class/power_supply/bms/temp_hot
echo 460 > /sys/class/power_supply/bms/temp_warm
echo 3200000 > /sys/class/power_supply/usb/current_max
echo 3200000 > /sys/class/power_supply/usb/hw_current_max
echo 3200000 > /sys/class/power_supply/usb/pd_current_max
echo 3200000 > /sys/class/power_supply/usb/ctm_current_max
echo 3200000 > /sys/class/power_supply/usb/sdp_current_max
echo 3200000 > /sys/class/power_supply/main/current_max
echo 3200000 > /sys/class/power_supply/main/constant_charge_current_max
echo 3200000 > /sys/class/power_supply/battery/current_max
echo 3200000 > /sys/class/power_supply/battery/constant_charge_current_max
echo 4400000 > /sys/class/qcom-battery/restricted_current
echo 3200000 > /sys/class/power_supply/pc_port/current_max
echo 3200000 > /sys/class/power_supply/constant_charge_current__max

#Start Battery Power Magament service
/system/etc/doublepowwer
