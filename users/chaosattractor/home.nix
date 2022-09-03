{ config, pkgs, ... }:
{
    programs.home-manager.enable = true;

    home.stateVersion = "22.05";
    
    # Software
    imports = [
        ./fish/fish.nix
        ./software/basic.nix
        ./software/tools/tools.nix
        ./software/work/work.nix
        ./software/develop/develop.nix
        ./software/games/games.nix
    ];

    nixpkgs.config.allowUnfree = true;
}