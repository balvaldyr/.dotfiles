#!/bin/bash

#percent="$(amixer -c 1 -M -D default get Master | grep -o -E [[:digit:]]+% | head -n 1)"
#percent=${percent::-1}
percent="$(pulsemixer --get-volume  | sed -e 's/\s.*$//')"
if [ "$(pulsemixer --get-mute)" == "1" ]; then
	echo " MM"
	echo""
	echo "#878787"
else
	echo " $percent"
	echo""
	echo "#76009B"
fi

# First Linene : FULL_TEXT
# Second Line : SHORT_TEXT
# Third Line : COLOR


case $BLOCK_BUTTON in
  1) pavucontrol --class floater;; # l click
  2) ;; # middle clock click
  3) pulsemixer --toggle-mute ;; #amixer -q sset Master,0 toggle ;;  # right click, mute/unmute
  4) pulsemixer --change-volume +5;; #amixer -q sset Master,0 5%+ unmute;; # scroll up, increase
  5) pulsemixer --change-volume -5;; #amixer -q sset Master,0 5%- unmute;; # scroll down, decrease
esac

