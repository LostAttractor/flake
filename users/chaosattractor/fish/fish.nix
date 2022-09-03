{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        shell = pkgs.fish;
    };

    home-manager.users.chaosattractor = { pkgs, ... }: {
        programs.fish.enable = true;
        
        xdg.configFile."fish/fish_variables".source = ./fish_variables;
    };
}