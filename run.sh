#!/bin/bash

# debian_initial_setting

#0. sudo
# su
# /usr/sbin/usermod -aG sudo $1
# reboot now

#1. ssh
# sudo apt install openssh-server
# sudo systemctl enable sshd
# sudo systemctl start sshd

#2. firewall
sudo apt install ufw
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 5902/tcp

#3. net-tools
sudo apt install net-tools

#4. GNOME -> GNOME Flashback
# sudo tasksel

#5. VNC
sudo apt install tigervnc-standalone-server
#vncpasswd
cp tigervnc.conf ~/.vnc
#sudo vi /etc/tigervnc/vncserver.users -> :2=$1
#sudo systemctl enable tigervncserver@:2.service
#sudo systemctl start tigervncserver@:2.service

#6. GNOME Disable Sleep
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

#7. GNOME Disable Notification
gsettings set org.gnome.gnome-flashback notifications 'false'

#8. GNOME Disable Notification
sudo cp 45-remote-desktop-sanity.pkla /etc/polkit-1/localauthority/50-local.d
