#!/bin/bash

# TFUU
setenforce 0

# Disable Firewall
service iptables save
service iptables stop
chkconfig iptables off

### Setup EPEL and install cloud-init
yum update -y
yum install -y http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y cloud-init
passwd -l root

### Configure cloud-init for root
sed -i 's/disable_root:.*/disable_root: 0/g' /etc/cloud/cloud.cfg
sed -i 's/cloud-user/root/g' /etc/cloud/cloud.cfg

cat /etc/cloud/cloud.cfg
 
### Setup microQA: Source https://gist.github.com/viglesiasce/5847752
yum install -y python-devel python-setuptools gcc make python-virtualenv java-1.7.0-openjdk.x86_64 git ntp wget unzip ipython
 
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
chkconfig jenkins on
 
chkconfig ntpd on
service ntpd start

pushd /var/lib
git clone https://github.com/eucalyptus/micro-qa.git
rsync -va micro-qa/jenkins/ jenkins/
chown -R jenkins:jenkins jenkins/
popd
virtualenv /var/lib/jenkins/share/eutester-base
easy_install pip
service jenkins start
chkconfig jenkins on
