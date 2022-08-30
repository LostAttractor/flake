{ config, pkgs, ... }:
{
    imports = [
        ./basic.nix
        ./tools.nix
        ./develop.nix
        ./steam.nix
    ];
}