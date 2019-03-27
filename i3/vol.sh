#!/bin/bash
t=$(x=$(pactl list sinks >.ttemp;cat .ttemp| grep -n "State: RUNNING"|sed 's/[^0-9]//g');cat .ttemp|head -$((x-1))| tail -1|sed 's/[^0-9]//g')
x=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
  head -n $t | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
if [[ $x -le 150 ]]
then
  pactl set-sink-volume $t +5% 
fi
