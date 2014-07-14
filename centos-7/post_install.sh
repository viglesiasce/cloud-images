#!/bin/bash
cat > /etc/yum.repos.d/base.repo <<EOF
[base]
name=base
baseurl=http://buildlogs.centos.org/centos/7/os/x86_64-20140614/
gpgcheck=0
EOF
yum install -y http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
yum install -y cloud-init

### Configure cloud-init for root
sed -i 's/disable_root:.*/disable_root: 0/g' /etc/cloud/cloud.cfg
sed -i 's/cloud-user/root/g' /etc/cloud/cloud.cfg

cat /etc/cloud/cloud.cfg
