{ config, pkgs, ... }:
{
  # Package
  imports = [
    ./basic.nix
    ./tools/tools.nix
    ./work/work.nix
    ./develop/develop.nix
    ./gaming
  ];
}
