#!/bin/bash

cd "$(dirname "$0")"

PWD=$(pwd)
CONFIG_DIR=$PWD/config
DATA_DIR=$PWD/data/drive.lnk

docker run \
	--net host \
	--rm \
	--volume $CONFIG_DIR:/config \
	--volume $DATA_DIR:/data \
	greensheep/plex-server-docker-rpi:1.21.1.3830-6c22540d5