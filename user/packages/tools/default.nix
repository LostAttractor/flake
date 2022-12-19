{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    hyfetch
    screenfetch
    cmatrix
    v2ray
    ffmpeg-full
    appimage-run
    virt-manager
    rsync
    fsearch
    fragments
    you-get
    handlr
    xdotool
    you-get
    #xdg-launch
  ];

  imports = [
    ./rime.nix
    ./alacritty/alacritty.nix
  ];
}