{ config, pkgs, ... }:
{
    imports = [
        ./nur.nix
        ./basic.nix
        ./tools/tools.nix
        ./work/work.nix
        ./develop/develop.nix
        ./games/games.nix
    ];

    nixpkgs.config.allowUnfree = true;
}