#!/bin/bash

cd "$(dirname "$0")"

DOWNLOADED_DIR=$HOME/Documents/pi-server/Docker/Transmission/downloaded.lnk
TEMP_DIR=$HOME/Documents/pi-server/Docker/Transmission/tmp.lnk

docker run \
	--rm \
	--name transmission \
	-v $TEMP_DIR:/to_download \
	-v $DOWNLOADED_DIR:/output \
	-p 9091:9091 \
	-p 51413:51413 \
	-e USERNAME=admin -e PASSWORD=admin \
	jaymoulin/transmission