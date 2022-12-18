{ config, pkgs, ... }:
{
  # Package
  imports = [
    ./basic.nix
    ./tools
    ./work
    ./develop
    ./gaming
  ];
}
