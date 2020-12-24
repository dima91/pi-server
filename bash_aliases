
# Alias to update apt packages and upgrade those that have updates
updg='sudo apt update && sudo apt upgrade'


# Function to safely remove an external drive (as an external hard disk)
function remove_drive {
	# Checking arguments
	if [ $# != 2 ]
	then
		echo "Wrong arguments number"
		echo -e "Usage:\n\tremove_drive <path to mount point> <path to device to be removed>"
		echo -e "Example:\n\tremove_drive /media/pi/NAS_drive /dev/sda"
		return 1
	fi


	MOUNT_POINT="$1"
	DEVICE_PATH="$2"
	echo "jecting $2 mounted ar $1"

	if [ ! -f "$MOUNT_POINT" ]; then
    	echo "Mount point   $MOUNT_POINT   does not exist!"
		return 1
	fi
	if [ ! -f "$DEVICE_PATH" ]; then
    	echo "Device at path   $DEVICE_PATH   does not exist!"
		return 1
	fi


	sudo sync && echo "Synched"
	sleep 1
	sudo umount $MOUNT_POINT && echo "Unmounted"
	sleep 1
	sudo eject $DEVICE_PATH && echo "Ejected"
	sleep 1
	sudo udisksctl power-off -b $DEVICE_PATH && echo "Halted"

	return 0
}