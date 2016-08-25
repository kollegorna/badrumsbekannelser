#!/bin/bash

# Commands #
sed -i "\$a@chromium-browser --incognito --kiosk https://www.badrumsbekannelser.se/mirrors/f7ea862d-8c5d-4089-9b01-677ec2ec1219" /home/pi/.config/lxsession/LXDE-pi/autostart

sed -i 's/width=100/width=0/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/autohide=0/autohide=1/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel
sed -i 's/transparent=0/transparent=100/g' /home/pi/.config/lxpanel/LXDE-pi/panels/panel

apt-get install unclutter -y

reboot
