#!/system/bin/sh
# Sysconfig Patcher
# Copyright (C) 2017-2019, VR25 @ xda-developers
# License: GPLv3+


patch() {
  dir=$1 file="" pkg=""
  for file in $dir/*; do
    (file=$file
    sed -i '/<allow.in.*.save/s/<a/<!-- a/' $file
    for pkg in $(grep -v '#' $modPath/whitelist.txt); do
      sed -i "/<!-- allow.in.*.save.*$pkg/s/<!-- a/<a/" $file
    done) &
  done
  wait
}

file=""
patch=false
modPath=${0%/*}
etcDir=$modPath/system/etc
tmpDir=/dev/sysconfig-patcher
sysconfigDir=$tmpDir/sysconfig
systemMirror=$(echo /sbin/.*/mirror/system | awk '{print $1}')
magicGAppsDir=${modPath/sysconfig-patcher/MagicGApps}
g_prop=$magicGAppsDir/system/etc/g.prop

umask 022

# log
mkdir -p $tmpDir
exec 1>$tmpDir/post-fs-data.sh.log 2>&1

set -euxo pipefail

# system sysconfig/*
if [ ! -d $etcDir ] \
  || [ $(cat $modPath/.systemSizeK 2>/dev/null || echo 0) -ne $(du -s $systemMirror | awk '{print $1}') ]
then
  patch=true
  rm -rf $etcDir 2>/dev/null || :
  mkdir -p $etcDir $sysconfigDir
  for file in $systemMirror/etc/sysconfig/*; do
    grep -q '\<allow.in.*.save' $file 2>/dev/null \
      && cp $file $sysconfigDir/ || :
  done
  # export /system size for automatic repatching after ROM/GApps updates
  du -s $systemMirror | awk '{print $1}' > $modPath/.systemSizeK
fi

# MagicGApps sysconfig/*
if [ -d $magicGAppsDir ] \
  && [ $(sed -n s/versionCode=//p $magicGAppsDir/module.prop) -gt 201904050 ] \
  && [ $(cat $modPath/.MagicGApps) -ne $(sed -n 's/.*open_version=//p' $g_prop) ]
then
  patch=true
  mkdir -p $sysconfigDir
  for file in $magicGAppsDir/system/etc/sysconfig/*; do
    grep -q '\<allow.in.*.save' $file 2>/dev/null \
      && cp $file $sysconfigDir/ || :
  done
  # export ro.addon.open_version for automatic repatching after systemless GApps updates
  sed -n 's/.*open_version=//p' $g_prop > $modPath/.MagicGApps
fi

if $patch; then
  patch $sysconfigDir
  mv $sysconfigDir $etcDir/ 2>/dev/null \
    || mv -f $sysconfigDir/* $etcDir/sysconfig/ 2>/dev/null || :
  restorecon -R $modPath/system
  chown -R 0:0 $modPath/system
fi

mount -o bind $etcDir/sysconfig $magicGAppsDir/system/etc/sysconfig 2>/dev/null || :
exit $?
