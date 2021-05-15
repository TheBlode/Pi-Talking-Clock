#!/bin/bash
# ============================
# Pi Talking Clock
# Written by The Blode
# 10/05/21
# This script will run a talking clock on your Raspberry Pi
# ============================

# Get time
hour=$(date +%H)
hour=$(echo $hour | sed 's/^0*//')
minute=$(date +%M)

# Get AM or PM
if [ $hour gt 11 ]
    then
        # Set PM
        ampm="PM"

        # Get 12 hour clock hour
        if [ $hour ne 12 ]
            then
                hour=$(($hour-12))
        fi
else
    # Set AM
    ampm="AM"
fi

# Generate sound file
sudo pico2wave -w /home/pi/Desktop/time.wav "The current hour is $hour, $minute, $ampm" > /dev/null 2>&1

# Play sound
sudo mplayer -af volume=4.8 /home/pi/Desktop/time.wav > /dev/null 2>&1

# Sleep for a few seconds
sleep 5s

# Repeat again
sudo mplayer -af volume=4.8 /home/pi/Desktop/time.wav > /dev/null 2>&1

# Sleep for a few seconds
sleep 5s

# Repeat again
sudo mplayer -af volume=4.8 /home/pi/Desktop/time.wav > /dev/null 2>&1

# Exit
exit
