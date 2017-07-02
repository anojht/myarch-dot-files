#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

xrdb -merge ~/.Xresources

while true
do
	sh .xsetroot.sh
	
	BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
	STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
	if ([ $BATT -le 5 ] && [ $STATUS == 'Discharging' ]); then
		echo -e "\007" >/dev/tty10 && sleep 0.2
		echo -e "\007" >/dec/tty10 && sleep 0.2
		echo -e "\007" >/dev/tty10 && sleep 0.2

	fi

	sleep 10s
done &
		

xrandr --dpi 192
xbacklight = 10
exec dwm
