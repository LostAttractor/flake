{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        github-desktop
        jetbrains.idea-ultimate
        jetbrains.clion
        hugo
    ];
}