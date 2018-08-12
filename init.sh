# Open access to brightness controls for non-root users

echo "-------------------"
echo "Opening user access to brightness controls"
echo "-------------------"
chmod 666 /sys/class/backlight/intel_backlight/brightness
chmod 666 /sys/class/backlight/intel_backlight/max_brightness

DIR=/home/alex/Repos/scripts

$DIR/connect-wifi.sh
