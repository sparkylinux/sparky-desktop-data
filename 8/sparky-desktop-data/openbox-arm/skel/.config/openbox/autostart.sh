#! /bin/bash

if [ -f /usr/bin/sparky-polkit ]; then
sparky-polkit &
fi
if [ -f /usr/bin/nitrogen ]; then
nitrogen --restore &
fi
if [ -f /usr/bin/tint2 ]; then
tint2 &
elif [ -f /usr/bin/fbpanel ]; then
fbpanel &
fi
if [ -f /usr/bin/xscreensaver ]; then
xscreensaver -nosplash &
elif [ -f /usr/bin/sparky-locker ]; then
sparky-locker &
fi
if [ -f /usr/bin/pnmixer ]; then
(sleep 5; pnmixer) &
fi
if [ -f /usr/bin/pcmanfm ]; then
pcmanfm -d &
elif [ -f /usr/bin/thunar ]; then
thunar --daemon &
fi
if [ -f /opt/sparky/nm-applet-reload ]; then
/opt/sparky/nm-applet-reload &
fi
if [ -f /usr/bin/xdg-user-dirs-gtk-update ]; then
/usr/bin/xdg-user-dirs-gtk-update &
fi
CHECKPANEL=`pidof tint2`
if [ "$CHECKPANEL" != "" ]; then
if [ -f /etc/xdg/autostart/sparky-pi-mime.desktop ]; then
sudo rm -f /etc/xdg/autostart/sparky-pi-mime.desktop
fi
if [ -f /usr/bin/sparky-pi-mime ]; then
sudo rm -f /usr/bin/sparky-pi-mime
fi
fi
