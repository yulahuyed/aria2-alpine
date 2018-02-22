#!/bin/sh

slack () {
  if [ "${SLACK}" ]
  then
  curl -X POST -H 'Content-type: application/json' --data '{"text": "$1", "channel": "#private", "link_names": 1, "username": "Aria2", "icon_emoji": ":monkey_face:"}' ${SLACK}
  fi
} 

echo "$0 $1 $2 $3" >> /root/aria2/sdown.log

if [ $2 -eq 0 ]
then
  slack "Download Nothing!\n$1"
  exit 0
fi

if [ ! -f "~/.config/rclone/rclone.conf" ]
then
  slack "The files have downloaded, but no upload.\n$3"
  exit 0
else
  RCLONE_TYPE=$(cat ~/.config/rclone/rclone.conf | grep -oE '\[.*\]' | sed 's/\[\(.*\)\]/\1/g')
fi

nohup rclone copy $3 $RCLONE_TYPE: > /dev/null 2>&1 &
slack "The files have downloaded, ans start to upload.\n$3"
