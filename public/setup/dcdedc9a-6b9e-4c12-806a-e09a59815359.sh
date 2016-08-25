#!/bin/bash

# Commands #
sed -i "\$a@chromium-browser --incognito --kiosk https://www.badrumsbekannelser.se/mirrors/dcdedc9a-6b9e-4c12-806a-e09a59815359" /home/pi/.config/lxsession/LXDE-pi/autostart

sed -i 's/width=100/width=0/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/autohide=0/autohide=1/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/transparent=0/transparent=100/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel

apt-get install unclutter -y

reboot
