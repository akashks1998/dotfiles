#!/bin/bash
t=$(x=$(pactl list sinks >.ttemp;cat .ttemp| grep -n "State: RUNNING"|sed 's/[^0-9]//g');cat .ttemp|head -$((x-1))| tail -1|sed 's/[^0-9]//g')
pactl set-sink-volume $t -5% 
