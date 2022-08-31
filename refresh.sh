#!/bin/sh
rm -rf /etc/nixos/*
cp -rf ./ /etc/nixos/
rm -r /etc/nixos/.git
nixos-rebuild switch