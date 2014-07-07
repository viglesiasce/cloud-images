#
# Fedora base image
#
auth --useshadow --passalgo=sha512
# Reboot after installation
reboot
# Use network installation
url --url="http://mirror.cisp.com/CentOS/7/os/x86_64/"
repo --name="CentOS-Base" --baseurl=http://mirror.cisp.com/CentOS/7/os/x86_64/
# Do not configure the X Window System
skipx
# Firewall configuration
firewall --disabled
firstboot --disable
ignoredisk --only-use=vda
# Keyboard layouts
# old format: keyboard us
# new format:
keyboard --vckeymap=us --xlayouts='us','us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0
network  --hostname=localhost.localdomain
# Root password
rootpw --plaintext password
# SELinux configuration
selinux --disabled
# System services
services --enabled="network,ntpd,ntpdate"
# System timezone
timezone UTC
# System bootloader configuration
bootloader --append="serial=tty0 console=ttyS0,115200n8" --location=mbr --timeout=1 --boot-drive=vda
autopart --type=plain
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel --drives=vda

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

%packages --excludedocs --nobase --instLangs=en
@core
audit
bash
chkconfig
coreutils
curl
e2fsprogs
ntp
ntpdate
openssh-server
passwd
policycoreutils
rootfiles
sudo
system-config-firewall-base
-acl
-aic94xx-firmware
-atmel-firmware
-b43-openfwwf
-bfa-firmware
-cyrus-sasl
-efibootmgr
-ipw2200-firmware
-ivtv-firmware
-iwl100-firmware
-iwl1000-firmware
-iwl3945-firmware
-iwl4965-firmware
-iwl5000-firmware
-iwl5150-firmware
-iwl6000-firmware
-iwl6000g2a-firmware
-iwl6050-firmware
-libertas-usb8388-firmware
-mysql-libs
-plymouth
-plymouth-system-theme
-postfix
-ql2100-firmware
-ql2200-firmware
-ql23xx-firmware
-ql2400-firmware
-ql2500-firmware
-rt61pci-firmware
-rt73usb-firmware
-sysstat
-xorg-x11-drv-ati-firmware
-yum-utils
-zd1211-firmware

%end
