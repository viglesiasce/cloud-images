#!/bin/bash
yum install -y cloud-init
passwd -l root

### Configure cloud-init for root
sed -i 's/disable_root:.*/disable_root: 0/g' /etc/cloud/cloud.cfg
sed -i 's/fedora/root/g' /etc/cloud/cloud.cfg

cat /etc/cloud/cloud.cfg
