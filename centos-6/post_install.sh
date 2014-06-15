#!/bin/bash
yum install -y http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y cloud-init
passwd -l root

### Configure cloud-init for root
sed -i 's/disable_root:.*/disable_root: 0/g' /etc/cloud/cloud.cfg
sed -i 's/cloud-user/root/g' /etc/cloud/cloud.cfg

cat /etc/cloud/cloud.cfg
