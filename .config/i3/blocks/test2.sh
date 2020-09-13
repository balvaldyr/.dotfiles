bluetooth_powered=$(echo -e 'show' | bluetoothctl | grep Powered | sed 's/.*: //')
device=$(echo -e 'devices' | bluetoothctl | grep ^Device | head -1)
name=$(echo $device | sed -n 's/.* [0-9A-C:]*//p')
address=$(echo "$device" | sed -n 's/Device\s*\([0-9:A-F]*\) .*/\1/p')
connected=$(echo "$device" | sed -n 's/Device\s*\([0-9:A-F]*\) .*/\1/p' | awk '{print "info " $0}' | bluetoothctl | grep Connected | sed 's/.*: //')


echo "bluetooth_powered = $bluetooth_powered"
echo "device            = $device"
echo "name              = $name"
echo "address           = $address"
echo "connected         = $connected"
