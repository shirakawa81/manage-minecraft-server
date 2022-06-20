#!/bin/sh

CUR_DIR=`dirname $0`
. ${CUR_DIR}/common.sh

ps aux |grep -F -v grep|grep -F -v SCREEN|grep -F --quiet ${JARFILE}

if [ $? ]; then
	# ワールドアナウンス
	screen -S ${SCREEN_NAME} -X stuff 'say Save on SSD\015'
	# オートセーブOFF
	screen -S ${SCREEN_NAME} -X stuff 'save-off\015'
	# データセーブ
	screen -S ${SCREEN_NAME} -X stuff 'save-all\015'
	# セーブ待ち
	sleep 5s
	# SSDへ保存
	rsync -ar ${WORKSPACE}/ ${SAVE_DIR}/
	# オートセーブON
	screen -S ${SCREEN_NAME} -X stuff 'save-on\015'
	# ワールドアナウンス
	screen -S ${SCREEN_NAME} -X stuff 'say End save on SSD\015'
else
	echo "minecraft server is down."
fi

