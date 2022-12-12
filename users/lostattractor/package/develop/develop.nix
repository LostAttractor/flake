{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    lapce
    github-desktop
    # (github-desktop.override {
    #   commandLineArgs = [
    #     "--use-angle=vulkan"
    #     "--use-cmd-decoder=passthrough"
    #   ];
    # })
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    hugo
    # conda
    # (let 
    #   my-python-packages = python-packages: with python-packages; [ 
    #     numpy
    #     pandas
    #     requests
    #     pillow
    #     #other python packages you want
    #   ];
    #   python-with-my-packages = python3.withPackages my-python-packages;
    # in
    # python-with-my-packages)
  ];
}