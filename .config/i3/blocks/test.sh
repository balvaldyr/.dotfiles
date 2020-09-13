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

echo "$weather_short"
exit

while true; do
    curl wttr.in/Vienna?format=%c+%t| tee -a /tmp/weather2.txt
    sleep 5
done
exit

curl wttr.in/Vienna > /tmp/weather.txt
sed -i 's/\x1b\[[0-9;]*m//g' /tmp/weather.txt
cat /tmp/weather.txt


exit

weather_full="$(curl wttr.in/Vienna)"

#weather_html="$(echo $weather_full | aha -n | sed 's/style=\"color:\([a-z]*\);[a-z;:-]*\"/color:\1/g')"
escape_code=$'\033'
escape_sequence="$escape_code\\[[0-9; ]*m"
#echo $escape_sequence
weather_html="$(echo $weather_full | sed 's/$escape_code//g')"
#notify-send --urgency=normal "Weather Vienna" "$weather_html"
echo $weather_full
