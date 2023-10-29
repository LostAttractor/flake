{ pkgs, nur, ... }:
{
  home.packages = with pkgs; [
    neofetch
    hyfetch
    screenfetch
    cmatrix
    ffmpeg_5-full
    virt-manager
    fsearch
    fragments
    you-get
    handlr
    xdotool
    nmap
    rustdesk
    parsec-bin
    looking-glass-client
    powertop
    flameshot
    wgcf
    uxplay
    adoptopenjdk-icedtea-web
    metadata-cleaner
    gnome-decoder
    video-trimmer
    raider
    collision
    dialect
    eyedropper
  ] ++ [
    nur.repos.rewine.landrop
  ];

  imports = [
    ./rime
    ./alacritty
  ];
}