{ config, pkgs, ... }:
{
    xdg.configFile."fish/fish_variables".source = ./fish_variables;
}