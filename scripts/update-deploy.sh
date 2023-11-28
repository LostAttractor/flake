#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
./scripts/update-flake.sh
./scripts/deploy-flake.sh $*