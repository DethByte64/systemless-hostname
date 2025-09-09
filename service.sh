
MODDIR=${0%/*}

until [ "$(getprop sys.boot_completed)" = "1" ] && [ -d "/sdcard/Android" ]; do
  sleep 3
done

HOSTNAME=$(cat $MODDIR/hostname)
if [ "$HOSTNAME" = "" ]; then
  HOSTNAME=$(getprop ro.product.model | sed 's/ /-/g')
fi
echo "$HOSTNAME" > "/proc/sys/kernel/hostname"
