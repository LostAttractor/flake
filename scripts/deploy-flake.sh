#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
rsync -rt --delete --exclude={'scripts','.git'} ./* /etc/nixos/ # -v
nixos-rebuild switch $* --log-format internal-json -v |& nom --json