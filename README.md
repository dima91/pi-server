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
8. Install `openvpn ntfs-3g supervisor`

9. **TODO: INSTALL DOCKER**
10. **TODO: INSTALL OWNCLOUD**
11. **TODO: INSTALL PLEX**
12. **TODO: INSTALL TRANSMISSION**
12. **TODO: INSTALL WEBMIN**
12. **TODO: INSTALL SAMBA**