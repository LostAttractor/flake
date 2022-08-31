{ config, pkgs, ... }:
{
    imports = [
        ./basic.nix
        ./tools/tools.nix
        ./develop/develop.nix
        ./games/steam.nix
    ];
}