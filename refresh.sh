#!/bin/sh
rm -r /etc/nixos/
cp -rf ./ /etc/nixos
nixos-rebuild switch