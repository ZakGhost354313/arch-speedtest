#!/bin/bash -e

isodate='2014.12.01'
country='US'

echo Using Arch Linux ISO $isodate

if [[ -f mirrorlist && -s mirrorlist ]]; then
    echo Reusing previously downloaded mirrorlist

else
    echo Downloading "$country" mirrorlist
    curl --progress-bar \
        https://www.archlinux.org/mirrorlist/?country=$country > mirrorlist

    sed \
        -e '1,/United States/d' \
        -e 's/#Server = //' \
        -e "s:\$repo/os/\$arch:iso/$isodate/archlinux-$isodate-dual.iso:" \
        -i mirrorlist
fi

echo -e "\nStart ISO download"

# split = total concurrent connections
aria2c \
    --split=30 \
    --max-connection-per-server=2 \
    --max-tries=0 \
    --lowest-speed-limit=200K \
    $(cat mirrorlist | tr '\n' ' ')
