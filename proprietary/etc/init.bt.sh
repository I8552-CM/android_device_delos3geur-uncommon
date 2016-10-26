#!/system/bin/sh
# modified by lesleyxxx15
# originally by daniel

LOG_TAG="CSR7820"
BTUART_PORT=/dev/ttyHS0
BTSTATE=/sys/class/rfkill/rfkill0/state
PSCONFIG=/etc/PSConfig_7820.psr

logi ()
{
  /system/bin/log -t $LOG_TAG -p i ": $@"
}

loge ()
{
  /system/bin/log -t $LOG_TAG -p e ": $@"
}

failed ()
{
  loge "$1: Exit code $2"
  exit $2
}

#Enable power of CSR chip
logi "Enable BT Power"
echo "1" > $BTSTATE

# PS Config with bccmd
logwrapper /system/bin/bccmd -t bcsp -d $BTUART_PORT -b 115200 psload -r $PSCONFIG
case $? in
  0) logi "BCCMD initialization done";;
  *) failed "BCCMD initialization failed. Port initialization failure: $BTUART_PORT" $?;
     exit $?;;
esac

# Attach HCI 
logwrapper /system/bin/hciattach -p $BTUART_PORT bcsp 3000000 flow
case $? in
  0) logi "HCI attach done. Attached to port: $BTUART_PORT";;
  *) failed "HCI attach failed. Failed to attach to port: $BTUART_PORT" $?;
     exit $?;;
esac

exit 0
