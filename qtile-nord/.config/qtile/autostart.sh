#!/bin/bash

nitrogen --restore

nm-applet &

xfce4-clipman &

# dunst &

xautolock -locker /home/maximilien/lock.sh &
