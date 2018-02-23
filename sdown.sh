#!/bin/sh

slack () {
  if [ "${SLACK}" ]
  then
  curl -X POST -H 'Content-type: application/json' --data '{"text": "$1", "channel": "#private", "link_names": 1, "username": "Aria2", "icon_emoji": ":monkey_face:"}' ${SLACK}
  fi
} 


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

DLPATH="/root/downloads"
FILEPATH=`echo "$temp" | sed "s#$DLPATH/\(.*\)/.*#\1#"`

if [ $2 -eq 0 ]

slack "The files have downloaded, ans start to upload.\n$3"

rclone copy $3 $RCLONE_TYPE:
rm -rf $3
