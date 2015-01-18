Simple script that tries to max out downstream bandwidth using Arch Linux ISO
mirrors and [aria2](http://aria2.sourceforge.net/), ignoring broken and slow
mirrors.

Ctrl-C will terminate the download and aria2 will print a rate summary

You can restart using the existing mirrorlist and iso parts, or to start fresh
just run `git clean -dfx`

```
$ ./arch-speedtest.sh
Using Arch Linux ISO 2014.12.01
Downloading US mirrorlist
######################################################################## 100.0%

Start ISO download

[#1 SIZE:49.8MiB/578.0MiB(8%) CN:16 SPD:2.8MiBs ETA:3m5s]^C
2015-01-18 12:39:00.841089 NOTICE - Shutdown sequence commencing... Press Ctrl-C again for emergency shutdown.

2015-01-18 12:39:00.841707 NOTICE - Download GID#1 not complete: /home/calid/git/arch-speedtest/archlinux-2014.12.01-dual.iso

Download Results:
gid|stat|avg speed  |path/URI
===+====+===========+===========================================================
  1| ERR|   2.6MiB/s|/home/calid/git/arch-speedtest/archlinux-2014.12.01-dual.iso

```
