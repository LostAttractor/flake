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
    nvtop
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
    # Wireless utils
    iw
    wirelesstools
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
    # Nix Utils
    nix-output-monitor
    # Other utils
    sshx
  ];
}