#!/bin/sh

#screenの名前
SCREEN_NAME='mc-service'
MINECRAFT_DIR=/home/minecraft
WORKSPACE=${MINECRAFT_DIR}/workspace    # tmpfs上の領域とする
SAVE_DIR=${MINECRAFT_DIR}/save_dir      # SSD上の領域とする
JARFILE=server.jar

