#!/bin/bash
if [ "$1" = "?" ]; then
	echo "Touchscreen touches touchscreen only"
	echo "Usage: tsttso.sh XRANDR_DEVICE XINPUT_ID"
	exit 1
fi

if [ -z "$1" ]; then
	echo "Which xrandr device? Go ask xranr, mine was the one with the shitty resolution."
	echo "*******************************************"
	echo "It should be one of these: "
	xrandr | grep " connected "
	echo "*******************************************"
	exit 2
fi

if [ -z "$2" ]; then
	echo "What xinput id? Go ask xinput, mine was the one with 'Touchscreen' in the name."
	echo "*******************************************"
	echo "One of these...."
	xinput
	echo "*******************************************"
	exit 3
fi

XRANDR_DEVICE=$1
XINPUT_ID=$2

xinput map-to-output $XINPUT_ID $XRANDR_DEVICE


#Almost there... now the touchscreen is redirected, but its got an inverted x axis for some reason....
xinput set-prop $XINPUT_ID "Evdev Axis Inversion" 0 0