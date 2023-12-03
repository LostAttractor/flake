{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools
    gh
    # IDE
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
  ];

  imports = [
    ./jetbra
    ./vscode
  ];
}