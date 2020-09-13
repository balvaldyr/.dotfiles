#!/bin/bash

bluetooth_powered=$(echo -e 'show' | bluetoothctl | grep Powered | sed 's/.*: //')
device=$(echo -e 'devices' | bluetoothctl | grep ^Device | head -1)
name=$(echo $device | sed -n 's/.* [0-9A-C:]*//p')
address=$(echo "$device" | sed -n 's/Device\s*\([0-9:A-F]*\) .*/\1/p')
connected=$(echo "$device" | sed -n 's/Device\s*\([0-9:A-F]*\) .*/\1/p' | awk '{print "info " $0}' | bluetoothctl | grep Connected | sed 's/.*: //')


if [[ "$bluetooth_powered" == "no" ]]; then
    echo ""
    echo ""
    echo "#878787"
    bluetooth_toggle="yes"
else
    if [[ "$name" == "WH-CH700N" && "$connected" == "yes" ]]; then
        echo " "
        echo ""
    else
        echo ""
        echo ""
    fi
    if [[ "$connected" == "yes" ]]; then
        echo "#cd5c00"
    else
        echo "#444444"
    fi
    bluetooth_toggle="no"
fi

function reconnect {
    notify-send --urgency=normal "Bluetooth" "Reconnecting device $name ($device)"

    echo -e "disconnect $address" | bluetoothctl
    sleep 5

    echo -e "connect $address" | bluetoothctl
    sleep 5

    card=$(pacmd list-cards | grep -oP 'name: <\K(bluez[^>]*)')
    pacmd set-card-profile $card a2dp_sink
}

case $BLOCK_BUTTON in
1) reconnect ;; # left   click
2) blueman-manager;; # middle click
3) echo -e "power $bluetooth_toggle" | bluetoothctl ;; # right  click - toggle power
4) ;; # scroll up
5) ;; # scroll down
esac

