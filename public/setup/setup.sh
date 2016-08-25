#!/bin/bash
sed -i 's/console=tty1/console=tty3/g' /boot/cmdline.txt
sed -i 's/$/ logo.nologo loglevel=3/g' /boot/cmdline.txt

sed -i 's/#disable_overscan=1/disable_overscan=1/g' /boot/config.txt
sed -i 's/#framebuffer_width=1280/framebuffer_width=1080/g' /boot/config.txt
sed -i 's/#framebuffer_height=720/framebuffer_height=1920/g' /boot/config.txt
sed -i 's/#disable_overscan=1/disable_overscan=1/g' /boot/config.txt
sed -i "\$adisplay_rotate=3" /boot/config.txt

sed -i "\$adeb http://dl.bintray.com/kusti8/chromium-rpi jessie main" /etc/apt/sources.list
apt-get update && apt-get install chromium-browser -y --force-yes

cp /etc/xdg/lxsession/LXDE-pi/autostart /home/pi/.config/lxsession/LXDE-pi/autostart

sed -i 's/#@xscreensaver -no-splash/@xscreensaver -no-splash/g' /home/pi/.config/lxsession/LXDE-pi/autostart
sed -i 's/@pcmanfm --desktop/@pcmanfm --desktop-off/g' /home/pi/.config/lxsession/LXDE-pi/autostart
sed -i "\$a@xset s off\n@xset -dpms\n@xset s noblank" /home/pi/.config/lxsession/LXDE-pi/autostart
