{ config, pkgs, ... }:
{
    imports = [
        ./basic.nix
        ./tools/tools.nix
        ./work/work.nix
        ./develop/develop.nix
        ./games/games.nix
    ];
}