#!/bin/bash
wallpaperdir="$HOME/Pictures/Wallpapers"

files=($wallpaperdir/*)
randompic=`printf "%s\n" "${files[RANDOM % ${#files[@]}]}"`
feh --bg-fill --bg-scale $randompic
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
battery_status=$(acpi -b |tr ' ' '\n'| grep charged)
if [ "$battery_status" != "charged" ];then
  if [ $battery_level -le 15 ]; then
    notify-send "Battery is low: ${battery_level}%"
    xcowsay "Battery is low: ${battery_level}%"
  fi
fi
