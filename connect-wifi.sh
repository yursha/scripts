#/usr/bin/env sh

set -e

echo "--------------------"
echo "Activating Wi-Fi card"
echo "--------------------"
ip link set wlp1s0 up

echo "-------------------------------------"
echo "Connecting to Wi-Fi access point"
echo "-------------------------------------"
wpa_supplicant -iwlp1s0 -c/etc/wpa_supplicant/wpa_supplicant.conf  -B

echo "-------------------"
echo "Obtaining IP address"
echo "-------------------"
dhcpcd wlp1s0

echo "-------------------"
echo "Init completed"
echo "-------------------"
