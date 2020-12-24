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
8. Clone this repository inside `/home/pi/Documents
9. Install apt dependencies, Docker and Webmin by executing `setup.sh` script as sudoer
11. Make a backup of sdcard

### *OwnCloud installation*

12. The docker compose file to run the **OwnCloud server** is placed in the folder `Services/Owncloud`. To execute it automaticallu at startup, just put the *owncloud.conf* file in the configuration folder of *supervisor* (e.g. `/etc/supervisor/conf.d`) and type `sudo supervisorctl reread && sudo supervisorctl reload`.

	[Here](https://doc.owncloud.com/server/admin_manual/installation/docker/) is the oiginal guide to setup OwnCloud server. To edit owncloud configurations, see the [OwnCloud official guide]()


### *Plex installation*

13. To execute **Plex media server** just edit the *DATA_DIR* variable value in `Services/Plex/runner.sh` file to match locations of your media file (I've create a link to data directory), put *plex.conf* file in the configuration folder of *supervisor* (e.g. `/etc/supervisor/conf.d`) and type `sudo supervisorctl reread && sudo supervisorctl reload`. For the first time should be needed that the registartion of server is done directly inside the raspberry (through VNC for example).

	[Here](https://hub.docker.com/r/greensheep/plex-server-docker-rpi/) is the original guide to setup Plex server,


#### *Samba installation*

14. To install **Samba** ... todo, maybe using [this repo](https://github.com/dastrasmue/rpi-samba). **NOT TESTED**


### *Transmission installation*

15. To install **Transmission** edit *DOWNLOADED_DIR* and *TEMP_DIR* variable value in `Services/Transmission/runner.sh` file to match locations of output and temporary directories, put *transmission.conf* file in the configuration folder of *supervisor* (e.g. `/etc/supervisor/conf.d`) and type `sudo supervisorctl reread && sudo supervisorctl reload`.

	[Here](https://hub.docker.com/r/jaymoulin/transmission/) is the original guide to setup Transmission.


16. Reboot the system
