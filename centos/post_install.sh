#!/bin/bash
rm -rf /etc/udev/rules.d/70-persistent-net.rules
yum install -y http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y cloud-init
passwd -l root
