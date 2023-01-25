{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    hyfetch
    screenfetch
    cmatrix
    v2ray
    ffmpeg_5-full
    appimage-run
    virt-manager
    rsync
    fsearch
    fragments
    you-get
    handlr
    xdotool
    rustdesk
    parsec-bin
    looking-glass-client
  ];

  imports = [
    ./rime
    ./alacritty
  ];
}