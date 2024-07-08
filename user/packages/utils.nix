{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System information tool
    neofetch
    hyfetch
    fastfetch
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
    # JSON filter
    jnv
    # Diff
    difftastic
    # File manager
    yazi
    # Screenshot
    grim
    slurp
    wl-clipboard
    # Network utils
    nali
    tcping-go
    gping
    # Wireless utils
    iw
    # Web video downloader
    you-get
    # Viedo tool
    ffmpeg
    # Desktop tools
    handlr
    xdotool
    # Netowrk tools
    iperf3
    nmap
    tcpdump
    wgcf
    # Proxy
    v2ray
    xray
    sing-box
    tor
    # IMPI
    ipmitool
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
