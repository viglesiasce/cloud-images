#
# CentOS base image
#
lang en_US.UTF-8
keyboard us
skipx
timezone UTC
auth --useshadow --passalgo=sha512
selinux --disabled
firewall --disabled
bootloader --timeout=1  --append="serial=tty0 console=ttyS0,115200n8"
network --bootproto=dhcp --device=eth0 --onboot=on
services --enabled=network,ntpd,ntpdate
part / --size 1536 --grow --fstype ext3
zerombr
rootpw password
reboot

repo --name=Centos-Base --mirrorlist=http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=os

%packages --nobase --excludedocs --instLangs=en
@core
audit
bash
chkconfig
coreutils
curl
e2fsprogs
grub
kernel-xen
openssh-server
passwd
policycoreutils
rootfiles
sudo
system-config-firewall-base
ntp
ntpdate

# Package exclusions
-plymouth
-plymouth-system-theme
-efibootmgr
-acl
-atmel-firmware
-b43-openfwwf
-cyrus-sasl
-postfix
-sysstat
-xorg-x11-drv-ati-firmware
-yum-utils
-ipw2100-firmware
-ipw2200-firmware
-ivtv-firmware
-iwl1000-firmware
-iwl3945-firmware
-iwl4965-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6050-firmware
-libertas-usb8388-firmware
-rt61pci-firmware
-rt73usb-firmware
-mysql-libs
-zd1211-firmware
-ql2100-firmware
-ql2200-firmware
-ql23xx-firmware
-ql2400-firmware
-ql2500-firmware
-aic94xx-firmware
-aic94xx-firmware
-iwl6000g2a-firmware
-iwl100-firmware
-bfa-firmware

%end


%post --erroronfail
#
# Setup console
cat > /etc/init/ttyS0.conf <<EOF
stop on runlevel[016]
start on runlevel[345]
respawn
instance /dev/ttyS0
exec /sbin/mingetty /dev/ttyS0
EOF

sed -i 's/rhgb quiet//' /boot/grub/grub.conf
sed -i 's/hiddenmenu//' /boot/grub/grub.conf
sed -i 's/splashimage.*//' /boot/grub/grub.conf

#
# Disable zeroconf
echo "NOZEROCONF=yes" >> /etc/sysconfig/network

%end
