#/usr/bin/env sh

set -e

ip link set wlp1s0 up
echo "--------------------"
echo "Activated Wi-Fi card"
echo "--------------------"

wpa_supplicant -iwlp1s0 -c/etc/wpa_supplicant/wpa_supplicant.conf  -B
echo "-------------------------------------"
echo "INFO: Connected to Wi-Fi access point"
echo "-------------------------------------"

dhcpcd wlp1s0
echo "-------------------"
echo "Obtained IP address"
echo "-------------------"
