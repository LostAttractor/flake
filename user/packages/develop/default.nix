{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools
    gh
    # IDE
    # vscode
    lapce
    github-desktop
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    # Tools-Chain
    hugo
    openjdk8
    devbox
    # Language Server
    nil
    # zulu8
    # conda
  ];

  imports = [
    ./jetbra
    ./vscode
  ];
}