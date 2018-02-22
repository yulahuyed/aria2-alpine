#!/bin/sh

slack () {
  if [ "${SLACK}" ]
  then
  curl -X POST -H 'Content-type: application/json' --data '{"text": "$1", "channel": "#private", "link_names": 1, "username": "Aria2", "icon_emoji": ":monkey_face:"}' ${SLACK}
  fi
} 

echo "$0 $1 $2 $3" >> /root/aria2/errdown.log

slack "The files have started to download.\n$3"
