# SETUP 

**Below are listed some instructions for a basic setup**


1. Download a Raspbian image [here](https://www.raspberrypi.org/downloads/raspbian/) and burn it into an sd card
2. Enable serial connection by opening the file called *config.txt* in the *noot* partition and insert these lines
	```
	# Enable UART
	enable_uart=1
	```
	after these lines
	```
	# Enable audio (loads snd_bcm2835)
	dtparam=audio=on
	```
3. Boot the raspbery and connect to it using the serial connection or an SSH session
4. Using **raspi-config** perform following steps:
	+ update the tool
	+ change *pi* user password
	+ connect to a wifi network
	+ enable SSH connection
	+ edit localisation options (...)
	+ enable VNC module
	+ expand filesystem
5. Update the whole system (`sudo apt update && sudo apt upgrade`)
6. Reboot the system
7. Download VNC client [here](https://www.realvnc.com/en/connect/download/viewer/) to see the remote desktop on the raspberry
8. Install `openvpn ntfs-3g supervisor eject vim`

#### *Docker installation*

9. Type following commands:
```
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install apt-transport-https ca-certificates software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt install docker.io docker-compose
sudo reboot
sudo usermod -aG docker $USER
sudo systemctl enable docker
```

10. Configure nas_drive automount at boot ([original guide](https://gist.github.com/etes/aa76a6e9c80579872e5f)) by typing:
```
sudo blkid
# Take the UUID
sudo mkdir /mnt/NAS_drive              # Create the mount point
sudo chmod 770 /mnt/NAS_drive          # Give it proper permissions
# Get *uid* and *gid* for pi user and group with **id** command (usually 1000)
# Take the device to be mounted with **sudo fdisk -l** command (usuallly /dev/sda1)
sudo mount /dev/sda1 /mnt/NAS_DRIVE    # Mount the device to check correctness
sudo cp /etc/fstab /etc/fstab.backup   # Take a backup of current fstab
# Edit */etc/fstab* file adding this line at the end of file: `/dev/sda1 /mnt/NAS_drive ntfs defaults 0 0`
sudo usermod -aG pi www-data           # Add pi user to www-data group (needed for owncloud)
```
11. Copy **Docker** folder in the home folder (*/home/pi/*)

*OwnCloud installation (from [OwnCloud wiki page](https://doc.owncloud.com/server/admin_manual/installation/docker/) and [GitHub page](https://github.com/owncloud-docker/server))*

12. Type following commands:
```
cd Docker/OwnCloud
sudo cp owncloud.conf /etc/supervisor/conf.d
sudo supervisorctl reread
sudo supervisorctl reload
```

13. The OwnCloud server is now accessible at port 8090
14. Enable external storage by admin settings and create the external storage access

#### *Plex installation*

#### *Transimission installation*

#### *Webmin installation*

#### *Samba installation*