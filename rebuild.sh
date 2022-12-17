#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
sudo rm -R /etc/nixos/*
rsync -a --exclude={'update.sh','refresh.sh','rebuild.sh','.git'} /home/lostattractor/nixos/* /etc/nixos/ # -v
cd /etc/nixos/
nixos-rebuild switch -v