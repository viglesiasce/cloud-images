# Cloud Images
This repository is intended to allow for the easy creation and customization of cloud images for use on KVM based cloud computing infrastructures. We are using Packer to create repeatable images.

The steps provided here were tested on CentOS 6.

# How To 

1. Download Packer: 

        wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip -O packer.zip

2. Unzip Packer

        unzip packer.zip -d /usr/local/bin

3. Install virt-sysprep

        yum install -y libguestfs-tools-c
        
4. Download this repository

        wget https://github.com/viglesiasce/cloud-images/archive/master.zip
        
5. Unzip this repository

        unzip cloud-images-master.zip
        
6. Enter the directory of the image you'd like to create

        cd cloud-images-master/centos
        
7. Run Packer

        packer build centos-packer.json
        
8. Sysprep the image

        virt-sysprep -a output-qemu/*.raw

Once that process completes you will have a RAW image in the `output-qemu` directory which is ready to be uploaded to your cloud of choice. 

For example in Eucalyptus 4.0:

        euca-install-image -i output-qemu/centos-base.raw --virtualization-type hvm -b centos-base -r x86_64 --name centos-base

# Customizing your image
In order to customize your image change the parameters in the json file found in each distro's folder. Here you can change the size, output format, or provisioning/customization steps. 

For more information on how to customize a Packer run please see: http://www.packer.io/docs

# Contributing
In order to contribute a new distro send a pull request with a new folder with the name of the distribution. This folder should contain all the artifacts necessary to create the most basic functioning cloud image based on this distribution.  
