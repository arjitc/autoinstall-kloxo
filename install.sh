#!/bin/bash
echo Starting Kloxo install...
read -p "press [enter] to start..."
setenforce 0
yum install -y wget
wget http://download.lxcenter.org/download/kloxo/production/kloxo-installer.sh
sh ./kloxo-installer.sh --type=master
cd /usr/local/lxlabs/kloxo/httpdocs/
php ../bin/raw_update.phps
sh /script/upcp
sh /script/cleanup
service xinetd restart
echo Done Kloxo installed
