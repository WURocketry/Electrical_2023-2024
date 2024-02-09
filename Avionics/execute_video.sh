#!/bin/bash

count=0

while [ true ]; do
	count=$((count+1))
	#echo ~/Desktop/elsberry_full_2_10_24/$count.h264
	libcamera-vid --width 1280 --height 720 -t 300000 --framerate 50 -o /home/rocketrycamera/Desktop/elsberry_full_2_10_24/$count.h264
done
