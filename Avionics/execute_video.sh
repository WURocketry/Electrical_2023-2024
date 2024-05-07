#!/bin/bash

count=0

flightNum=$(cat /home/rocketrycamera/Desktop/Flight_Counter.txt)
mkdir /home/rocketrycamera/Desktop/Flight_Number_$flightNum

while [ true ]; do
	count=$((count+1))
	#echo ~/Desktop/elsberry_full_2_10_24/$count.h264
	libcamera-vid --width 1280 --height 720 -t 420000 --framerate 30 -o /home/rocketrycamera/Desktop/Flight_Number_$flightNum/$count.h264
done
