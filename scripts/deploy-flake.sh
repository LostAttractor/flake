#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
nixos-rebuild switch --flake .# $* --log-format internal-json -v |& nom --json