{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools / IDE
    vscode
    lapce
    # github-desktop
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    # Tools-Chain
    hugo
    # conda
  ];
}