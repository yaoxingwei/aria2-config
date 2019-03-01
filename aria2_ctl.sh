#!/bin/sh
case $1 in
start)
	./aria2c --conf-path=/home/yxw/config/aria2-asus.conf -D
	;;
stop)
	killall -9 aria2c
	;;
restart)
	killall -9 aria2c
	sleep 1
	./aria2c --conf-path=/home/yxw/config/aria2-asus.conf -D
	;;
esac
