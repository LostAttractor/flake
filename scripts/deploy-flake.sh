#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
rsync -r --delete --exclude={'scripts','.git'} ./* /etc/nixos/ # -v
nixos-rebuild switch $*