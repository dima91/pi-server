#!/bin/bash

cd "$(dirname "$0")"

PWD=$(pwd)
CONFIG_DIR=$PWD/config
DATA_DIR=$PWD/data/drive.lnk

docker run \
	--name plex \
	--net host \
	-p 32400:32400 \
	--rm \
	--volume $CONFIG_DIR:/config \
	--volume $DATA_DIR:/data \
	greensheep/plex-server-docker-rpi:latest