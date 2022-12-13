{ config, pkgs, ... }:
{
    programs.fish.enable = true;
    # xdg.configFile."fish/fish_variables".source = ./fish_variables;
}