# Cloud Images
This repository is intended to allow for the easy creation and customization of cloud images for use on KVM based cloud computing infrastructures. We are using Packer to create repeatable images.

The steps provided here were tested on CentOS 6.

# How To 

1. Download Packer
>  wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip
2. Unzip Packer
> unzip 0.6.0_linux_amd64.zip -d /usr/local/bin
3. Download this repository
>  wget https://github.com/viglesiasce/cloud-images/archive/master.zip
4. Unzip this repository
> unzip cloud-images-master.zip
5. Enter the directory of the image you'd like to create
> cd cloud-images-master/centos
6. Run Packer
 > packer build centos-packer.json

Once that process completes you will have a directory `output-qemu` which contains your RAW cloud image.

# Customizing your image
In order to customize your image change the parameters in the json file found in each distro's folder. Here you can change the size, output format, or provisioning/customization steps. 
