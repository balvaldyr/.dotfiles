#!/bin/bash

#echo " $(date +%y‧%-m‧%-d)"
#echo " $(date +%D)"
echo " $(date +%d/%m/%Y)"
year=$(date '+%Y')
month=$(date '+%m')
case $BLOCK_BUTTON in
	1) gnome-calendar --class floater;; # l click
	2) ;; # middle clock click
	3) ;;  # right click, mute/unmute
	4) ;; # scroll up, increase
	5) ;; # scroll down, decrease
esac
