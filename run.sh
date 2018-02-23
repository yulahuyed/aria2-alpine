#!/bin/sh

sed -i "s/yhiblog/${ARIA2_TOKEN}/g" /root/aria2/aria2.conf

if [ ! -f "/root/aria2/aria2.session" ]; then
  touch /root/aria2/aria2.session
fi

if [ ! -f "/root/aria2/dht.dat" ]; then
  touch /root/aria2/dht.dat
fi

# Enable for IPV6 DHT and Edit aria2.conf
#if [ ! -f "/root/aria2/dht6.dat" ]; then
#  touch /root/aria2/dht.dat
#fi

if [ "${RCLONE_CONFIG}" ]
then
mkdir -p ~/.config/rclone
curl -L -o ~/.config/rclone/rclone.conf "${RCLONE_CONFIG}" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0"
fi


/usr/bin/aria2c --conf-path /root/aria2/aria2.conf
