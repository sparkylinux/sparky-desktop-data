#! /bin/bash

### polkit agent
sparky-polkit &
### wallpaper tool
sleep 0.5 && nitrogen --restore &
### top bar
tint2 &
### audio tray applet
sleep 5 && pnmixer &
### automatic mounting of external storage devices and other less important stuff.
thunar --daemon &
### networkmanager tray applet
if [ -f /opt/sparky/nm-applet-reload ]; then
/opt/sparky/nm-applet-reload &
fi
### power manager - particularly important for laptop users
if [ -f /usr/bin/xfce4-power-manager ]; then
/usr/bin/xfce4-power-manager &
fi
### creates a full suite of localized default user directories within the $HOME directory
if [ -f /usr/bin/xdg-user-dirs-update ]; then
/usr/bin/xdg-user-dirs-update &
fi
### dock
sleep 1 && plank &
### desktop composing (vsync, transparency, fading and stuff). resource hungry - disable if you don't care for eye candy.
picom -b &
### welcome message. Remove or comment out when gets boring.
sleep 5 && notify-send --icon=face-smile-panel --expire-time=8000 'Hi and Welcome' '\nTip: hovering over the elements of the upper bar will display a tooltip with basic information \n\nright click to dismiss' &
