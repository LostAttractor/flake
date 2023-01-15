{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools / IDE
    vscode
    lapce
    # github-desktop
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    # jetbrains.pycharm-community
    # Tools-Chain
    hugo
    openjdk8
    # zulu8
    # conda
  ];

  imports = [
    ./jetbra
  ];
}