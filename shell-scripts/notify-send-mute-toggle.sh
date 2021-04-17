#!/bin/sh
pactl set-sink-mute @DEFAULT_SINK@ toggle && notify-send -t 2000 "toggled mute"
