#!/bin/sh

sed -i "s/yhiblog/${ARIA2_TOKEN}/g" /aria2/aria2.conf

if [ ! -f "/aria2/aria2.session" ]; then
  touch /aria2/aria2.session
fi

if [ ! -f "/aria2/dht.dat" ]; then
  touch /aria2/dht.dat
fi

# Enable for IPV6 DHT and Edit aria2.conf
#if [ ! -f "/aria2/dht6.dat" ]; then
#  touch /aria2/dht.dat
#fi

if [ "${RCL_LINK}" ]
then
mkdir -p ~/.config/rclone
curl -L -o ~/.config/rclone/rclone.conf "${RCL_LINK}" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0"
fi


/usr/bin/aria2c --conf-path /aria2/aria2.conf
