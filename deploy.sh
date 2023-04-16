#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
rm -R /etc/nixos/*
rsync -a --exclude={'deploy.sh','flake.sh','refresh.sh','.git'} ./* /etc/nixos/ # -v
nixos-rebuild switch -v $*