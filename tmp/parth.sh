# GODSPEED STABLE
# VERSION = v1.0 | STABLE
# DATE = 16-8-2021
# !/sbin/sh

busybox mount /system

#Backup

if [ ! -f /system/vendor/etc/thermal-engine.conf.parth ]; then
  cp /system/vendor/etc/thermal-engine.conf /system/vendor/etc/thermal-engine.conf.parth
fi

if [ ! -f /system/etc/thermal-engine.conf.parth ]; then
  cp /system/etc/thermal-engine.conf /system/vendor/etc/thermal-engine.conf.parth
fi

