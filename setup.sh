#!/bin/bash

# TODO Checking arguments

# Instaling apt dependencies
sudo apt install openvpn ntfs-3g supervisor eject vim build-essential git perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime \
					libio-pty-perl apt-show-versions python


# Installing Docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt install apt-transport-https ca-certificates software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt install docker.io docker-compose
sudo usermod -aG docker $USER

# Installing "Webmin" tool
sudo bash -c "echo deb https://download.webmin.com/download/repository sarge contrib >>  /etc/apt/sources.list"
cd ~/Downloads
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
sudo apt update
sudo apt install apt-transport-https webmin
sudo systemctl enable docker

# Adding pi user to www-data group (needed for OwnCloud)
sudo usermod -aG pi www-data