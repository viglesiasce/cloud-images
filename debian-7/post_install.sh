#!/bin/bash
apt-get install cloud-init
history -c
apt-get autoremove
apt-get autoclean
apt-get clean

#curl https://raw.githubusercontent.com/viglesiasce/cloud-images/master/utils/rc.local > /etc/rc.local
#chmod +x /etc/rc.local
passwd -l root
