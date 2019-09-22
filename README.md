# SETUP 

**Below are listed some instructions for a basic setup**


1. Download a Raspbian image [here](https://www.raspberrypi.org/downloads/raspbian/) and burn it into an sd card
2. Enable serial connection by opening the file called *config.txt* in the *boot* partition and insert these lines
	```
	# Enable UART
	enable_uart=1
	```
	after these lines
	```
	# Enable audio (loads snd_bcm2835)
	dtparam=audio=on
	```
3. Boot the raspbery and connect to it using the serial connection
4. Using **raspi-config** perform following steps:
	+ update the tool
	+ change *pi* user password
	+ connect to a wifi network
	+ enable SSH connection
	+ edit localisation options (it depends on your timezone)
	+ enable VNC module
5. Update the whole system (`sudo apt update --fix-missing && sudo apt upgrade --fix-missing`)
6. Reboot the system
7. Download VNC client [here](https://www.realvnc.com/en/connect/download/viewer/) to see the remote desktop on the raspberry
8. Install `openvpn ntfs-3g supervisor eject vim build-essential git perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python`

#### *Docker installation*

9. Type following commands:

```
sudo apt-get remove docker docker-engine docker.io containerd runc \
; sudo apt install apt-transport-https ca-certificates software-properties-common gnupg2 \
&& curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
&& sudo apt install docker.io docker-compose \
&& sudo usermod -aG docker $USER \
&& sudo systemctl enable docker \
&& sudo reboot
```

10. Clone this repository inside `/home/pi/Documents'

11. Make a backup of sdcard before doing else

12. Configure nas_drive automount at boot ([original guide](https://gist.github.com/etes/aa76a6e9c80579872e5f)) by typing:
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

#### *OwnCloud installation*

13. The docker compose file to run the **OwnCloud server** is placed in the folder `Docker/Owncloud`. To execute it automaticallu at startup, just put the *owncloud.conf* file in the configuration folder of *supervisor* (e.g. `/etc/supervisor/conf.d`) and type `sudo supervisorctl reread && sudo supervisorctl reload`.

	[Here](https://ssi.le-piolot.fr/running-owncloud-w-ssl-in-a-raspberry-pi-docker-container/) is the oiginal guide to setup OwnCloud server. To edit owncloud configurations, change the file *config.php* placede at path `/var/lib/docker/volumes/owncloud_html-volume/_data/config/config.php`

#### *Plex installation*

14. To execute **Plex media server** just put *plex.conf* file in the configuration folder of *supervisor* (e.g. `/etc/supervisor/conf.d`) and type `sudo supervisorctl reread && sudo supervisorctl reload`.

	[Here](https://hub.docker.com/r/greensheep/plex-server-docker-rpi/) is the original guide to setup Plex server,

#### *Samba installation*

15. To install **Samba** ... todo, maybe using [this repo](https://github.com/dastrasmue/rpi-samba)

#### *Transmission installation*

16. To install **Transmission** --- todo, maybe using [this docker image](https://hub.docker.com/r/jaymoulin/rpi-transmission/)

#### *Webmin installation*

17. To install **Webmin** type following commands:
```
sudo bash -c "echo deb https://download.webmin.com/download/repository sarge contrib >>  /etc/apt/sources.list"
cd ~/Downloads
wget http://www.webmin.com/jcameron-key.asc
apt-key add jcameron-key.asc
sudo apt update
sudo apt install apt-transport-https webmin
```

18. Reboot the system
