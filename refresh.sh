#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -rf /etc/nixos/*
cp -rf ./ /etc/nixos/
rm -r /etc/nixos/.git
nixos-rebuild switch