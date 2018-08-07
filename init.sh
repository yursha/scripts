# Open access to brightness controls for non-root users

chmod 666 /sys/class/backlight/intel_backlight/brightness
chmod 666 /sys/class/backlight/intel_backlight/max_brightness

DIR=/home/alex/Repos/scripts

$DIR/connect-wifi.sh
