#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
##########################################################################################
# GodSpeed Mode
#Gilgamesh
##########################################################################################


# Enable Spectrum support
setprop persist.spectrum.kernel "GodSpeedMode"
setprop spectrum.support 1

su -c "gsm &"

# Log
if [ -e /storage/emulated/0/GSM/GSM.log ]; then
rm /storage/emulated/0/GSM/GSM.log
fi

wait_until_login
sleep 60
# Setup tweaks
GodSpeedMode


# VM Management Tweaks Set Config
echo '10' > proc/sys/vm/stat_interval;
echo '0' > /proc/sys/vm/laptop_mode;
echo '0' > /proc/sys/vm/panic_on_oom;
echo '100' > /proc/sys/vm/swappiness;
echo '3000' > proc/sys/vm/dirty_expire_centisecs;
echo '3000' > /proc/sys/vm/dirty_writeback_centisecs;
echo '0' > proc/sys/vm/page-cluster;

# Scheduler Tweaks
if [[ -f "/sys/kernel/debug/sched_features" ]]
then
	echo 'NEXT_BUDDY' > /sys/kernel/debug/sched_features;
	echo 'TTWU_QUEUE' > /sys/kernel/debug/sched_features;
	echo 'HRTICK' > sys/kernel/debug/sched_features;
fi

# Virtual Memory Tweaks Set Config
stop perfd
echo '1' > /proc/sys/vm/reap_mem_on_sigkill;
echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk;
echo '60' > /proc/sys/vm/vfs_cache_pressure;
echo '29615' > /proc/sys/vm/extra_free_kbytes;
echo '64' > /sys/block/mmcblk0/queue/read_ahead_kb;
echo '64' > /sys/block/mmcblk1/queue/read_ahead_kb;
echo '64' > /sys/block/ram0/queue/read_ahead_kb;
echo '64' > /sys/block/ram1/queue/read_ahead_kb;
echo '64' > /sys/block/ram2/queue/read_ahead_kb;
echo '64' > /sys/block/ram3/queue/read_ahead_kb;
echo '64' > /sys/block/ram4/queue/read_ahead_kb;
echo '64' > /sys/block/ram5/queue/read_ahead_kb;
echo '64' > /sys/block/ram6/queue/read_ahead_kb;
echo '64' > /sys/block/ram7/queue/read_ahead_kb!
echo '64' > /sys/block/ram8/queue/read_ahead_kb;
echo '64' > /sys/block/ram9/queue/read_ahead_kb;
echo '64' > /sys/block/ram10/queue/read_ahead_kb;
echo '64' > /sys/block/ram11/queue/read_ahead_kb;
echo '64' > /sys/block/ram12/queue/read_ahead_kb;
echo '64' > /sys/block/ram13/queue/read_ahead_kb;
echo '64' > /sys/block/ram14/queue/read_ahead_kb;
echo '64' > /sys/block/ram15/queue/read_ahead_kb;
echo '64' > /sys/block/vnswap0/queue/read_ahead_kb;
echo '7686' > /proc/sys/vm/min_free_kbytes;
echo '0' > /proc/sys/vm/oom_kill_allocating_task;
echo '30' > /proc/sys/vm/dirty_ratio;
echo '10' > /proc/sys/vm/dirty_background_ratio;
sleep 30
chmod 666 /sys/module/lowmemorykiller/parameters/minfree;
chown root /sys/module/lowmemorykiller/parameters/minfree;
echo '21816,29088,36360,43632,50904,65448' > /sys/module/lowmemorykiller/parameters/minfree;
rm /data/system/perfd/default_values;
start perfd

# CPU Boost Tweaks Set Config
echo '0' > /sys/devices/system/cpu/isolated;
echo '0' > /sys/devices/system/cpu/offline;
echo '0' > /sys/devices/system/cpu/uevent;
echo '0' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/iowait_boost_enable;
echo '0' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/iowait_boost_enable;
echo '902400' > /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_min_freq;
echo '1113600' > /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_min_freq;
echo '902400' > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq;
echo '1113600' > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq;
echo '1113600' > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed;
echo '1113600' > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed;

# Kernel Tweaks
echo '5' > /proc/sys/kernel/perf_cpu_time_max_percent;
echo '0' > /proc/sys/kernel/sched_autogroup_enabled;
echo '1' > /proc/sys/kernel/sched_child_runs_first;
echo '0' > /proc/sys/kernel/sched_tunable_scaling;
echo '1000000' > /proc/sys/kernel/sched_latency_ns;
echo '100000' > /proc/sys/kernel/sched_min_granularity_ns;
echo '100000' > /proc/sys/kernel/sched_wakeup_granularity_ns;
echo '5000000' > /proc/sys/kernel/sched_migration_cost_ns;
echo '0' > /proc/sys/kernel/sched_min_task_util_for_colocation;
echo '8' > /proc/sys/kernel/sched_nr_migrate;
echo '0' > /proc/sys/kernel/sched_schedstats;
echo '64' > /proc/sys/kernel/sched_nr_requests;

#Wakelock Blocker
echo 'qcom_rx_wakelock;wlan;wlan_wow_wl;wlan_extscan_wl;netmgr_wl;NETLINK;IPA_WS;[timerfd];wlan_ipa;wlan_pno_wl;wcnss_filter_lock;IPCRTR_lpass_rx;hal_bluetooth_lock' > /sys/class/misc/boeffla_wakelock_blocker/wakelock_blocker;

# DT2W Fix
echo '1' > /sys/touchpanel/double_tap;

# Enable Fast Charging Rate
if [ -e /sys/kernel/fast_charge/force_fast_charge; ]; then
  echo '1' > /sys/kernel/fast_charge/force_fast_charge;
  
# Fast Charging Tweaks Set Config
echo '2000000' > /sys/module/qpnp_smbcharger/parameters/default_dcp_icl_ma;
echo '1800000' > /sys/module/qpnp_smbcharger/parameters/default_hvdcp_icl_ma;
echo '2400000' > /sys/module/qpnp_smbcharger/parameters/default_hvdcp3_icl_ma;
echo '1800000' > /sys/module/dwc3_msm/parameters/hvdcp_max_current;
echo '2000000' > /sys/module/dwc3_msm/parameters/dcp_max_current;
echo '2000000' > /sys/module/phy_msm_usb/parameters/dcp_max_current;
echo '1800000' > /sys/module/phy_msm_usb/parameters/hvdcp_max_current;
echo '1200000' > /sys/module/qpnp_smb2/parameters/weak_chg_icl_ua;

#Quick Charge 3.0 Specific settings:
#Battery Maximum charging current, just a initial value.
echo '150' > /sys/class/power_supply/bms/temp_cool;
echo '450' > /sys/class/power_supply/bms/temp_hot;
echo '450' > /sys/class/power_supply/bms/temp_warm;
echo '3400000' > /sys/class/power_supply/usb/current_max;
echo '3400000' > /sys/class/power_supply/usb/hw_current_max;
echo '3400000' > /sys/class/power_supply/usb/pd_current_max;
echo '3400000' > /sys/class/power_supply/usb/ctm_current_max;
echo '3400000' > /sys/class/power_supply/usb/sdp_current_max;
echo '3400000' > /sys/class/power_supply/main/current_max;
echo '3400000' > /sys/class/power_supply/main/constant_charge_current_max;
echo '3400000' > /sys/class/power_supply/battery/current_max;
echo '3400000' > /sys/class/power_supply/battery/constant_charge_current_max;
echo '3400000' > /sys/class/qcom-battery/restricted_current;
echo '3400000' > /sys/class/power_supply/pc_port/current_max;
echo '3400000' > /sys/class/power_supply/constant_charge_current__max;

# ==============================================================
# ==============================================================
# ==============================================================
# renice processes at wake. All credits goes to lpy: http://forum.xda-developers.com/showthread.php?t=1137554
# ==============================================================
# ==============================================================
# ==============================================================


    ### Phone dialer app ###
#    renice -1 `pidof com.android.phone`;

    ### System apps ###
#    renice -1 `pidof com.android.mms`; # Text message app
#    renice -1 `pidof com.swype.android.inputmethod`; # Keyboard
#    renice -1 `pidof com.sec.android.app.controlpanel`; # Task manager
#    renice -1 `pidof com.android.systemui`; # Status bar
#    renice -1 `pidof com.android.settings`; # Settings menu
#    renice -1 `pidof com.android.vending`; # Market app
#    renice -1 `pidof com.sec.android.app.camera`; # Camera app
#    renice -1 `pidof android.process.acore`;
#    renice -1 `pidof kondemand/0`;
#    renice -1 `pidof ksmartass_up/0`;

# Analytics Remover
rm -rf /data/data/com.rahul.videoderbeta/shared_prefs/com.google.android.gms.analytics.prefs.xml
rm -rf /data/data/com.google.android.deskclock/shared_prefs/com.google.android.gms.analytics.prefs.xml
rm -rf /data/data/com.google.android.play.games/shared_prefs/com.google.android.gms.analytics.prefs.xml
rm -rf /data/data/com.digibites.accubattery/shared_prefs/com.google.android.gms.analytics.prefs.xml
rm -rf /data/data/com.vanced.android.youtube/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -rf /data/data/com.paget96.lsandroid/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -rf /data/data/com.samsung.android.mobileservice/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -rf /data/data/droom.sleepIfUCan/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.rahul.videoderbeta/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.sec.android.app.samsungapps/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.google.android.play.games/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.digibites.accubattery/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.sec.android.daemonapp/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/in.android.vcredit/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.rubenmayayo.reddit/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.osp.app.signin/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.samsung.android.rubin.app/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.google.android.googlequicksearchbox/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.core.lntmobile/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.samsung.android.dynamiclock/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.paget96.netspeedindicator/shared_prefs/com.google.android.gms.measurement.prefs.xml
rm -f /data/data/com.paget96.lsandroid/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/droom.sleepIfUCan/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/droom.sleepIfUCan/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/droom.sleepIfUCan/shared_prefs/frc_1:633738944520:android:716b5964e99d2c3d_firebase_settings.xml
rm -f /data/data/com.camerasideas.instashot/shared_prefs/frc_1:1000386510336:android:ab5973db7e7e86ed_firebase_settings.xml
rm -f /data/data/com.touchtype.swiftkey/shared_prefs/com.google.firebase.messaging.xml
rm -f /data/data/com.google.android.play.games/shared_prefs/com.google.firebase.common.prefs:W0RFRkFVTFRd+MTo1OTM5NTA2MDI0MTg6YW5kcm9pZDpjNGRhMWMwNTdjZjU3YmE4.xml
rm -f /data/data/org.telegram.messenger/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/org.telegram.messenger/shared_prefs/frc_1:760348033671:android:f6afd7b67eae3860_firebase_settings.xml
rm -f /data/data/in.android.vcredit/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/in.android.vcredit/shared_prefs/frc_1:1002943954979:android:bfc8b0f2ed5f47a0_firebase_settings.xml
rm -f /data/data/com.rubenmayayo.reddit/shared_prefs/frc_1:275128417090:android:3dc63557758b5b0f_firebase_settings.xml
rm -f /data/data/com.rubenmayayo.reddit/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/photo.editor.photoeditor.photoeditorpro/shared_prefs/frc_1:757324348735:android:caaddb32e54f9271_firebase_settings.xml
rm -f /data/data/wifisecurity.ufovpn.android/shared_prefs/frc_1:76973129151:android:ab00156b263ee3195ef50a_firebase_settings.xml
rm -f /data/data/com.paget96.netspeedindicator/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/user_de/0/com.samsung.android.fmm/shared_prefs/com.google.firebase.messaging.xml
rm -f /data/data/com.paget96.lsandroid/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/droom.sleepIfUCan/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/droom.sleepIfUCan/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/com.touchtype.swiftkey/shared_prefs/com.google.firebase.messaging.xml
rm -f /data/data/com.google.android.play.games/shared_prefs/com.google.firebase.common.prefs:W0RFRkFVTFRd+MTo1OTM5NTA2MDI0MTg6YW5kcm9pZDpjNGRhMWMwNTdjZjU3YmE4.xml
rm -f /data/data/org.telegram.messenger/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/in.android.vcredit/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/com.rubenmayayo.reddit/shared_prefs/com.google.firebase.remoteconfig_legacy_settings.xml
rm -f /data/data/com.paget96.netspeedindicator/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/user_de/0/com.samsung.android.fmm/shared_prefs/com.google.firebase.messaging.xml
rm -f /data/data/com.touchtype.swiftkey/shared_prefs/telemetry_service_key.xml
rm -f /data/data/com.samsung.android.biometrics.app.setting/shared_prefs/com.samsung.android.biometrics.app.setting_preferences.xml
rm -f /data/data/com.samsung.android.tadownloader/shared_prefs/tad_biometrics_info.xml
rm -f /data/data/com.google.android.gms/shared_prefs/GnssmetricsPH.xml
rm -f /data/data/com.google.android.gms/shared_prefs/com.google.android.metrics.xml
rm -f /data/data/com.paget96.lsandroid/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/droom.sleepIfUCan/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/com.rahul.videoderbeta/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/com.rahul.videoderbeta/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/com.samsung.android.game.gamehome/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/com.samsung.android.game.gamehome/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/in.android.vcredit/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/in.android.vcredit/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/com.opera.max.oem/shared_prefs/com.crashlytics.sdk.android.crashlytics-core:com.crashlytics.android.core.CrashlyticsCore.xml
rm -f /data/data/com.opera.max.oem/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/com.opera.max.oem/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/com.rubenmayayo.reddit/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/com.rubenmayayo.reddit/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/photo.editor.photoeditor.photoeditorpro/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/photo.editor.photoeditor.photoeditorpro/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/com.hiya.star/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/com.hiya.star/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/wifisecurity.ufovpn.android/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/wifisecurity.ufovpn.android/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/ir.stsepehr.hamrahcard/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/ir.stsepehr.hamrahcard/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/com.intsig.camscanner/shared_prefs/com.crashlytics.sdk.android:answers:settings.xml
rm -f /data/data/com.intsig.camscanner/shared_prefs/com.crashlytics.prefs.xml
rm -f /data/data/com.paget96.netspeedindicator/shared_prefs/com.google.firebase.crashlytics.xml
rm -f /data/data/com.samsung.android.mobileservice/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.appsedge/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.themestore/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.sec.android.app.quicktool/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.contacts/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.calendar/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.sec.android.app.samsungapps/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.routines/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.net.wifi.wifiguider/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.messaging/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.galaxyfinder/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.dialer/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.sec.android.daemonapp/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.social/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.applock/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.taskedge/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.mdecservice/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.mdx.quickboard/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.aodservice/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.storyservice/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.dqagent/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.osp.app.signin/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.rubin.app/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.rubin.app/shared_prefs/SamsungAnalyticsPrefs_runestone.xml
rm -f /data/data/com.samsung.android.rubin.app/shared_prefs/SamsungAnalyticsPrefs_ad.xml
rm -f /data/data/com.samsung.android.allshare.service.fileshare/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.sec.android.app.camera/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.mdx/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.game.gametools/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.dynamiclock/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.simplesharing/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.lool/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.app.cocktailbarservice/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.sec.android.app.myfiles/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.samsung.android.video/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.sec.android.app.launcher/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/user_de/0/com.samsung.android.fmm/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/user_de/0/com.android.systemui/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/user_de/0/com.samsung.android.incallui/shared_prefs/SamsungAnalyticsPrefs.xml
rm -f /data/data/com.netflix.mediaclient/shared_prefs/com.netflix.mediaclient.client_cast_analytics_data.xml
rm -f /data/data/com.instagram.android/shared_prefs/com.facebook.analytics.appstatelogger.AppStateBroadcastReceiver.xml
rm -f /data/data/com.instagram.android/shared_prefs/analyticsprefs.xml
rm -f /data/data/com.instagram.android/shared_prefs/rti.mqtt.analytics.xml

# GMS blocker v1.1
### FeraDroid Engine v0.19 | By FeraVolt. 2016 ###
# Modified by AkumaHunt3r and Pedroginkgo
busybox killall -9 com.google.android.gms
busybox killall -9 com.google.android.gms.persistent
busybox killall -9 com.google.process.gapps
busybox killall -9 com.google.android.gsf
busybox killall -9 com.google.android.gsf.persistent

su -c "pm disable com.google.android.gms/.ads.settings.AdsSettingsActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.places.ui.aliaseditor.AliasEditorActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.places.ui.aliaseditor.AliasEditorMapActivity"
sleep "0.001"
su -c  "pm disable com.google.android.gms/com.google.android.location.settings.ActivityRecognitionPermissionActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.settings.GoogleLocationSettingsActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.settings.LocationHistorySettingsActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.settings.LocationSettingsCheckerActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/.usagereporting.settings.UsageReportingActivity"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.adinfo.AdvertisingInfoContentProvider"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.ReportingContentProvider"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.internal.LocationContentProvider"
sleep "0.001"
su -c "pm enable com.google.android.gms/.common.stats.net.contentprovider.NetworkUsageContentProvider"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.gms.ads.config.GServicesChangedReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.contextmanager.systemstate.SystemStateReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.jams.SystemEventReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.config.FlagsReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.social.DoritosReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.AnalyticsReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.internal.GServicesChangedReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.common.analytics.CoreAnalyticsReceiver"
sleep "0.001"
su -c "pm enable com.google.android.gms/.common.stats.GmsCoreStatsServiceLauncher"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.internal.AnalyticsSamplerReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.checkin.CheckinService\$ActiveReceiver'
sleep "0.001"
su -c "pm disable com.google.android.gms/.checkin.CheckinService\$ClockworkFallbackReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.checkin.CheckinService\$ImposeReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.checkin.CheckinService\$SecretCodeReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.checkin.CheckinService\$TriggerReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.checkin.EventLogService\$Receiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.ExternalChangeReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.GcmRegistrationReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.copresence.GcmRegistrationReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.copresence.GservicesBroadcastReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.internal.LocationProviderEnabler"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.internal.NlpNetworkProviderSettingsUpdateReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.network.ConfirmAlertActivity\$LocationModeChangingReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.places.ImplicitSignalsReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.libraries.social.mediamonitor.MediaMonitor"
sleep "0.001"
su -c "pm disable com.google.android.gms/.location.copresence.GcmBroadcastReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.location.reporting.service.GcmBroadcastReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.social.location.GservicesBroadcastReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.update.SystemUpdateService\$Receiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.update.SystemUpdateService\$OtaPolicyReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.update.SystemUpdateService\$SecretCodeReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/.update.SystemUpdateService\$ActiveReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.contextmanager.service.ContextManagerService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.ads.AdRequestBrokerService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.GservicesValueBrokerService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.identifier.service.AdvertisingIdNotificationService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.ads.identifier.service.AdvertisingIdService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.jams.NegotiationService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.pan.PanService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.ads.social.GcmSchedulerWakeupService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.AnalyticsService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.internal.PlayLogReportingService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.service.AnalyticsService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.service.PlayLogMonitorIntervalService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.analytics.service.RefreshEnabledStateService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.auth.be.proximity.authorization.userpresence.UserPresenceService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.common.analytics.CoreAnalyticsIntentService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.common.stats.GmsCoreStatsService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.backup.BackupStatsService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.deviceconnection.service.DeviceConnectionAsyncService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.deviceconnection.service.DeviceConnectionServiceBroker"
sleep "0.001"
su -c "pm disable com.google.android.gms/.wallet.service.analytics.AnalyticsIntentService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.checkin.CheckinService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.checkin.EventLogService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.internal.AnalyticsUploadIntentService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.DeleteHistoryService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.DispatchingService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.InternalPreferenceServiceDoNotUse"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.LocationHistoryInjectorService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.ReportingAndroidService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.reporting.service.ReportingSyncService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.activity.HardwareArProviderService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.fused.FusedLocationService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.fused.service.FusedProviderService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.geocode.GeocodeService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.geofencer.service.GeofenceProviderService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.internal.GoogleLocationManagerService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.location.places.PlaylogService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.places.service.GeoDataService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.places.service.PlaceDetectionService"
sleep "0.001"
su -c "pm disable com.google.android.gms/com.google.android.libraries.social.mediamonitor.MediaMonitorIntentService"
sleep "0.001"
su -c "pm disable com.google.android.gms/.config.ConfigService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.stats.PlatformStatsCollectorService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.usagereporting.service.UsageReportingService"
sleep "0.001"
su -c "pm enable com.google.android.gms/.update.SystemUpdateService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.network.ConfirmAlertActivity"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.network.LocationProviderChangeReceiver"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.internal.server.GoogleLocationService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.internal.PendingIntentCallbackService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.network.NetworkLocationService"
sleep "0.001"
su -c "pm enable com.google.android.gms/com.google.android.location.util.PreferenceService"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.update.SystemUpdateActivity"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.update.SystemUpdatePanoActivity"
sleep "0.001"
su -c "pm disable com.google.android.gsf/com.google.android.gsf.checkin.CheckinService\$Receiver"
sleep "0.001"
su -c "pm disable com.google.android.gsf/com.google.android.gsf.checkin.CheckinService\$SecretCodeReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gsf/com.google.android.gsf.checkin.CheckinService\$TriggerReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.checkin.EventLogService\$Receiver"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.update.SystemUpdateService\$Receiver"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.update.SystemUpdateService\$SecretCodeReceiver"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.checkin.CheckinService"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.checkin.EventLogService"
sleep "0.001"
su -c "pm disable com.google.android.gsf/.update.SystemUpdateService"
sleep "0.001"
su -c "pm disable com.google.android.apps.wellbeing/.powerstate.impl.PowerStateJobService"
sleep "0.001"
su -c "pm disable com.google.android.apps.wellbeing/androidx.work.impl.background.systemjob.SystemJobService"
sleep "0.001"
su -c "pm disable com.facebook.katana/com.facebook.analytics.appstatelogger.AppStateIntentService"
sleep "0.001"
su -c "pm disable com.facebook.orca/com.facebook.analytics.apptatelogger.AppStateIntentService"
sleep "0.001"
su -c "pm disable com.facebook.orca/com.facebook.analytics2.Logger.LollipopUploadService"
sleep "0.001"
fi

# This script will be executed in late_start service mode
# More info in the main Magisk thread
