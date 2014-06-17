#!/bin/bash
curl https://raw.githubusercontent.com/viglesiasce/cloud-images/master/utils/rc.local > /etc/rc.local
chmod +x /etc/rc.local
passwd -l root
passwd -l debian
