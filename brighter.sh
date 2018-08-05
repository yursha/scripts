#!/usr/bin/env sh

set -e

BRIGHTNESS=/sys/class/backlight/intel_backlight/brightness
MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)

DELTA=$1
CURRENT=$(cat $BRIGHTNESS)
NEW=$((CURRENT + DELTA))

NEW=$((NEW > MAX ? MAX : NEW))
NEW=$((NEW < 0 ? 0 : NEW))

echo $NEW  > $BRIGHTNESS
