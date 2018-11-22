#!/bin/bash

NEXTCLOUD_DATA_DIR=/mnt/volume_one/mash

echo
read -p "Only run this preparation script from the directory you want to launch docker-compose up from. Press a key to continue" -n1 -s
echo
read -p "Press enter if you are sure. A directory called $NEXTCLOUD_DATA_DIR will be prepared here, AFTER which you can run docker-compose up -d for the first time" -n1 -s
echo
sudo mkdir -p $NEXTCLOUD_DATA_DIR
sudo chown www-data:www-data $NEXTCLOUD_DATA_DIR
echo
echo " Done, now run docker-compose up -d"

