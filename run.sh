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
wget -O ~/.config/rclone/rclone.conf ${RCLONE_CONFIG}
fi

/usr/bin/aria2c --conf-path /root/aria2/aria2.conf
