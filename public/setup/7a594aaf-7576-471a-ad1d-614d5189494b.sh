#!/bin/bash

# Commands #
sed -i "\$a@chromium-browser --incognito --kiosk https://www.badrumsbekannelser.se/mirrors/7a594aaf-7576-471a-ad1d-614d5189494b" /home/pi/.config/lxsession/LXDE-pi/autostart

sed -i 's/width=100/width=0/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/autohide=0/autohide=1/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/transparent=0/transparent=100/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel

apt-get install unclutter -y

reboot
