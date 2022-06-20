#!/bin/sh
CUR_DIR=`dirname $0`
. ${CUR_DIR}/common.sh

if [ -n "$(screen -list | grep -o "${SCREEN_NAME}")" ]; then
    # 停止開始
    echo 'server stop script start'
    # サーバー内にアナウンス
    screen -S ${SCREEN_NAME} -X stuff 'say 10秒後にサーバーを停止します\015'
    sleep 8s
    # オートセーブOFF
    screen -S ${SCREEN_NAME} -X stuff 'save-off\015'
    # セーブコマンド発行
    screen -S ${SCREEN_NAME} -X stuff 'save-all\015'
    sleep 2s
    # SSDへ保存
    rsync -ar ${WORKSPACE}/ ${SAVE_DIR}/
    sleep 5s
    # 停止コマンド発行
    screen -S ${SCREEN_NAME} -X stuff 'stop\015'
    #停止実行待機
    sleep 5s
else
    echo 'server is not runnning'
fi

