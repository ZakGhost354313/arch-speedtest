#!/bin/bash

isodate='2014.12.01'

curl https://www.archlinux.org/mirrorlist/?country=US > mirrorlist

sed \
    -e '1,/United States/d' \
    -e 's/#Server = //' \
    -e "s:\$repo/os/\$arch:iso/$isodate/archlinux-$isodate-dual.iso:" \
    -i mirrorlist

aria2c -x2 -m0 -s30 --lowest-speed-limit=200K $(cat mirrorlist | tr '\n' ' ')
