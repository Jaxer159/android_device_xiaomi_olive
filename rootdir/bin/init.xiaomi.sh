#!/vendor/bin/sh

FDT_XIAOMI_DEVICE="/sys/firmware/devicetree/base/xiaomi,device"
FDT_XIAOMI_SERIES="/sys/firmware/devicetree/base/xiaomi,series"

if [ -f ${FDT_XIAOMI_DEVICE} ]; then
	setprop ro.xiaomi.device $(cat ${FDT_XIAOMI_DEVICE})
fi

if [ -f ${FDT_XIAOMI_SERIES} ]; then
	setprop ro.xiaomi.series $(cat ${FDT_XIAOMI_SERIES})
fi
