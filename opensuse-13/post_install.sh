#!/bin/bash
curl https://raw.githubusercontent.com/viglesiasce/cloud-images/master/utils/rc.local > /etc/init.d/after.local
chmod +x /etc/init.d/after.local
passwd -l root
