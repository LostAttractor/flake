{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System information tool
    neofetch
    hyfetch
    screenfetch
    cpufetch
    powertop
    bottom
    btop
    # Terminal utils
    lolcat
    cmatrix
    # Alternative to ls/cat
    bat
    lsd
    # Web video downloader
    you-get
    # Viedo tool
    ffmpeg
    # Desktop tools
    handlr
    xdotool
    # Netowrk tools
    nmap
    tcpdump
    wgcf
    # Disk analayzer
    gdu
    # Develop Tools
    gh
    hugo
    devbox
    # Language Server
    nil
    # Other utils
    sshx
  ];
}