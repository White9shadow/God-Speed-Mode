MINAPI=25
MAXAPI=31
DEBUG=true

ARCH SDK=`getprop ro.build.version.sdk`

ui_print " 
▒█▀▀▀█ █▀▀█ █▀▀ █▀▀ ▀▀█▀▀ █▀▀█ █░░█ █▀▄▀█ 
░▀▀▀▄▄ █░░█ █▀▀ █░░ ░░█░░ █▄▄▀ █░░█ █░▀░█ 
▒█▄▄▄█ █▀▀▀ ▀▀▀ ▀▀▀ ░░▀░░ ▀░▀▀ ░▀▀▀ ▀░░░▀ "
  ui_print "       
░██████╗░░█████╗░██████╗░
██╔════╝░██╔══██╗██╔══██╗
██║░░██╗░██║░░██║██║░░██║
██║░░╚██╗██║░░██║██║░░██║
╚██████╔╝╚█████╔╝██████╔╝
░╚═════╝░░╚════╝░╚═════╝░

░██████╗██████╗░███████╗███████╗██████╗░
██╔════╝██╔══██╗██╔════╝██╔════╝██╔══██╗
╚█████╗░██████╔╝█████╗░░█████╗░░██║░░██║
░╚═══██╗██╔═══╝░██╔══╝░░██╔══╝░░██║░░██║
██████╔╝██║░░░░░███████╗███████╗██████╔╝
╚═════╝░╚═╝░░░░░╚══════╝╚══════╝╚═════╝░      "
  ui_print "         VERSION v5 | Gilgamesh      "
sleep 1
  ui_print "
░█▀▀█ ─▀─ █── █▀▀▀ █▀▀█ █▀▄▀█ █▀▀ █▀▀ █──█ 
░█─▄▄ ▀█▀ █── █─▀█ █▄▄█ █─▀─█ █▀▀ ▀▀█ █▀▀█ 
░█▄▄█ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀──▀ ▀───▀ ▀▀▀ ▀▀▀ ▀──▀ "
sleep 1
  ui_print "        UNLOCKED 90FPS "
sleep 1
  ui_print "        THERMALS FOR GAMING "
sleep 1
  ui_print "        AIM ASSETS BOOSTED"
sleep 1
  ui_print "        TOUCH BOOSTED "
sleep 1
  ui_print "        GPU BOOSTED "
sleep 1
  ui_print "        CPU BOOSTED "
sleep 1
  ui_print "        INTERNET BOOSTED "
sleep 1
  ui_print "        DOZE MODE ACTIVE "
sleep 1
  ui_print "        FORCE FAST CHARGING RATE "
sleep 1
  ui_print "        MEDIA QUALITY IMPROVED "
sleep 1
  ui_print "        REDUCE HEAT "   
sleep 1
  ui_print "        95%FPS STABILISED "
  ui_print " "
sleep 1 
ui_print "   🙏 Big Big Thanks to WeAreRevens and revWhiteShadow@tg inspired from Spectrum"
ui_print "  ........................."
ui_print " "          
ui_print "  revWhiteShadow  "
ui_print "  ........................."
ui_print " "
ui_print "  Remove Other Tweaks and performance type applications"
ui_print " "
ui_print ""
sleep 3
ui_print " Optimizing device Please Wait It Can Take 5-10 Minutes"
fstrim -v /system
fstrim -v /data
fstrim -v /cache
ui_print " Optimizing Complete "
ui_print " You Can Boost Your Device With Terminal Command  su -c boost"
ui_print "[*] Installing GOD SPEED MODE ..."
pm install $MODPATH/gsm.apk
sleep 1
ui_print ""
ui_print "[*] Installing GODSPEED MODE Toast app..."
pm install $MODPATH/gsmtoast.apk
sleep 1
ui_print ""
sleep 1
ui_print ""
ui_print "- Installing for $ARCH SDK device..."
sleep 2

set_permissions() {
set_perm_recursive $MODPATH/system/bin 0 0 0755 0755
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
