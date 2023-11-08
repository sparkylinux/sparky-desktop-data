#! /bin/bash

#annoying beep no more
xset b off &
### polkit agent
sparky-polkit &
### wallpaper tool
nitrogen --restore &
### top bar
tint2 &
### audio tray applet
sleep 5 && pnmixer &
### automatic mounting of external storage devices and other less important stuff.
if [ -f /usr/bin/pcmanfm ]; then
pcmanfm -d &
elif [ -f /usr/bin/thunar ]; then
thunar --daemon &
fi
### networkmanager tray applet
if [ -f /opt/sparky/nm-applet-reload ]; then
/opt/sparky/nm-applet-reload &
fi
### power manager - particularly important for laptop users
if [ -f /usr/bin/xfce4-power-manager ]; then
/usr/bin/xfce4-power-manager &
fi
### creates a full suite of localized default user directories within the $HOME directory
if [ -f /usr/bin/xdg-user-dirs-gtk-update ]; then
/usr/bin/xdg-user-dirs-gtk-update &
fi
### desktop composing (vsync, transparency, fading and stuff). resource hungry - disable if you don't care for eye candy.
systemd-detect-virt -q && picom -bCG || picom -bCG --backend glx --vsync &
### dock first run
if [ -f ~/.config/openbox/sparky-plank1 ]; then
	echo "plank conf already set"
	sleep 1 && plank &
else
	CHECKDATA=`apt-cache policy sparky-desktop-data | head -2 | tail -n1 | cut -f4 -d " " | cut -f2 -d "~"`
	if [ $CHECKDATA \< 20200520 ]; then
		sleep 5 && notify-send --icon=state-warning --expire-time=6000 'Openbox Noir components are missing' '\nSystem upgrade will start in a moment\n\nclick to dismiss'
		sleep 4	&& x-terminal-emulator -e 'remsu sparky-upgrade'
		cat /usr/share/sparky-desktop-data/openbox-noir/plank/docks.ini | dconf load /net/launchpad/plank/docks/
		touch ~/.config/openbox/sparky-plank1
		sleep 1 && plank &
	fi
	cat /usr/share/sparky-desktop-data/openbox-noir/plank/docks.ini | dconf load /net/launchpad/plank/docks/
	touch ~/.config/openbox/sparky-plank1
	sleep 1 && plank &
fi
### welcome message. Remove or comment out when gets boring.
#sleep 5 && notify-send --icon=face-smile-panel --expire-time=8000 'Hi and Welcome' '\nTip: hovering over the elements of the upper bar will display a tooltip with basic information \n\nright click to dismiss' &
