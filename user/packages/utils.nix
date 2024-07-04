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
    nvtopPackages.full
    # Terminal utils
    lolcat
    cmatrix
    # Alternative to ls/cat
    bat
    lsd
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
    charm-freeze
    # Language Server
    nil
    # Nix Utils
    nix-output-monitor
    sops
    # Other utils
    sshx
  ];
}
