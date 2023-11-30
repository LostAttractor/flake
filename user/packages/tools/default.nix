{ pkgs, nur, ... }:
{
  home.packages = with pkgs; [
    neofetch
    hyfetch
    screenfetch
    cpufetch
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
    ranger
    bottom
    btop
    bat
    lsd
    localsend
    sshx
  ] ++ [
    nur.repos.rewine.landrop
  ];

  imports = [
    ./alacritty
    ./fzf
  ];
}