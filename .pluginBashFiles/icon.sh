#!/usr/bin/env bash

batteryInfo=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "state\|percentage\|time to empty" | cut -d":" -f 2 | sed -e 's/ //g' | sed -e 's/%//g' `

state=`echo $batteryInfo | cut -d' ' -f1`
if [ $state == "charging" ] 
then 
    echo -e "#[fg=colour226] \c"
else
    percentage=`echo $batteryInfo | cut -d' ' -f3`
    if (($percentage > 90))
    then
        battery="#[fg=colour46]"
    elif (($percentage > 80))
    then
        battery="#[fg=colour46]"
    elif (($percentage > 70))
    then
        battery="#[fg=colour76]"
    elif (($percentage > 60))
    then
        battery="#[fg=colour76]"
    elif (($percentage > 50))
    then
        battery="#[fg=colour228]"
    elif (($percentage > 40))
    then
        battery="#[fg=colour228]"
    elif (($percentage > 30))
    then
        battery="#[fg=colour11]"
    elif (($percentage > 20))
    then
        battery="#[fg=colour11]"
    elif (($percentage > 10))
    then
        battery="#[fg=colour1]"
    else
        battery="#[fg=colour1]"
    fi
    time=`echo $batteryInfo | cut -d' ' -f2`
    echo -e "$time $battery $percentage% \c"
fi 

