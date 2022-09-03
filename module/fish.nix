{ config, pkgs, ... }:
{
    programs.fish.enable = true;
    # users.defaultUserShell = pkgs.fish;
    environment.shells = with pkgs; [ fish ];
}