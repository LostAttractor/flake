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
    # Git utils
    lazygit
    # File manager
    yazi
    # Screenshot
    grim
    slurp
    wl-clipboard
    # Network utils
    trippy
    tcping-go
    gping
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
    duf
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