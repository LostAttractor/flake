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
    # Grep
    ripgrep
    # Find
    fd
    # TLDR
    tldr
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
    yt-dlp
    # Viedo tool
    ffmpeg
    # Unzip
    p7zip
    # Desktop tools
    handlr
    xdotool
    # Netowrk tools
    iperf3
    nmap
    tcpdump
    pwru
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
    # Kubernetes
    kubectl
    kubectx
    kubernetes-helm
    helmfile
    k9s
    cilium-cli
    hubble
    argocd
    # Language Server
    nil
    # Nix Utils
    nix-output-monitor
    sops
    nurl
    nix-update
    # Wine
    wine
    winetricks
    # Binary Analayzer
    binwalk
    hexyl
    # Other utils
    openssl
    sshx
  ];
}
