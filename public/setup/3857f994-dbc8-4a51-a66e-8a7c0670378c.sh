#!/bin/bash

# Commands #
sed -i "\$a@chromium-browser --incognito --kiosk https://www.badrumsbekannelser.se/mirrors/3857f994-dbc8-4a51-a66e-8a7c0670378c" /home/pi/.config/lxsession/LXDE-pi/autostart

sed -i 's/width=100/width=0/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/autohide=0/autohide=1/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/transparent=0/transparent=100/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel

apt-get install unclutter -y

reboot
