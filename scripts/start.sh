#!/bin/sh
CUR_DIR=`dirname $0`
. ${CUR_DIR}/common.sh

# tmpfsにあるファイルをお掃除
rm -rf ${WORKSPACE}/*
rm -rf ${WORKSPACE}/.*

# SSDから tmpfs へ copy する
cp -r ${SAVE_DIR}/. ${WORKSPACE}

screen -UAmdS $SCREEN_NAME java -server -Dfile.encoding=UTF-8 -Xmx4G -Xms4G -jar ${WORKSPACE}/server.jar nogui

