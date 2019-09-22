#!/bin/bash

cd "$(dirname "$0")"

CONFIG_DIR=$HOME/Documents/pi-server/Docker/Plex/config
DATA_DIR=$HOME/Documents/pi-server/Docker/Plex/data/drive.lnk

docker run \
	--name plex \
	--net host \
	-p 32400:32400 \
	--rm \
	--volume $CONFIG_DIR:/config \
	--volume $DATA_DIR:/data \
	greensheep/plex-server-docker-rpi:latest