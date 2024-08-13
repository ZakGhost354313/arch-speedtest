#!/bin/bash -e

country='US'

echo Using Arch Linux ISO latest

if [[ -f mirrorlist && -s mirrorlist ]]; then
    echo Reusing previously downloaded mirrorlist

else
    echo Downloading "$country" mirrorlist
    curl --progress-bar \
        https://archlinux.org/mirrorlist/?country=$country&protocol=http&protocol=https&ip_version=4&ip_version=6 > mirrorlist

    sed -e '1,/United States/d' -e 's/#Server = //' -e "s:\$repo/os/\$arch:iso/latest/archlinux-x86_64.iso :" -i mirrorlist
fi

echo -e "\nStart ISO download"

# split = total concurrent connections
aria2c -i mirrorlist -s 30 --connect-timeout 15 -t 30 --uri-selector=feedback --allow-overwrite true --human-readable true --lowest-speed-limit=200K --max-tries=0
