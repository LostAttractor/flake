{ config, pkgs, ... }:
{
    programs.home-manager.enable = true;

    home.stateVersion = "22.11";
    
    # Software
    imports = [
        # ./fish/fish.nix
        ./package/basic.nix
        ./package/tools/tools.nix
        ./package/work/work.nix
        ./package/develop/develop.nix
        ./package/games/games.nix
    ];

    nixpkgs.config.allowUnfree = true;
}
