{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        vscode
        github-desktop
        jetbrains.idea-ultimate
        jetbrains.clion
        hugo
    ];
}