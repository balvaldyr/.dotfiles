#!/bin/bash

#echo "$weather_html"
#exit
# echo "$weather_full"
weather_short="$(curl wttr.in/Vienna?format=%c+%t)"
weather_short="$(echo $weather_short | sed 's/☀️//g')"
weather_short="$(echo $weather_short | sed 's/☁️//g')"
weather_short="$(echo $weather_short | sed 's/⛅️//g')"
weather_short="$(echo $weather_short | sed 's/⛈//g')"
weather_short="$(echo $weather_short | sed 's/✨/?/g')"
weather_short="$(echo $weather_short | sed 's/❄️//g')"
weather_short="$(echo $weather_short | sed 's/🌦//g')"
weather_short="$(echo $weather_short | sed 's/🌧//g')"
weather_short="$(echo $weather_short | sed 's/🌨//g')"
weather_short="$(echo $weather_short | sed 's/🌩//g')"
weather_short="$(echo $weather_short | sed 's/🌫//g')"
if [[ $weather_short == \<* ]]; then
    echo "No weather"
    echo ""
    echo "#76009B"
else
    echo "$weather_short"
    echo ""
    echo "#009b9b"
fi

# First Linene : FULL_TEXT
# Second Line : SHORT_TEXT
# Third Line : COLOR


case $BLOCK_BUTTON in
  1) ;; #notify-send --urgency=normal "Weather Vienna" "$weather_html";; # l click
  2) ;; # middle clock click
  3) ;;  # right click, mute/unmute
  4) ;; # scroll up, increase
  5) ;; # scroll down, decrease
esac

