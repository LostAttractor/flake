{ pkgs, inputs, ... }:
let
  inherit (pkgs.stdenv.hostPlatform) system;
  umu-launcher = inputs.umu.packages.${system}.default;
in
{
  home.packages = with pkgs; [
    # Terminal
    (blackbox-terminal.override { sixelSupport = true; })
    ptyxis
    # Web Browser
    chromium
    google-chrome
    brave
    # Social Apps
    tdesktop
    signal-desktop
    element-desktop
    cinny-desktop
    fractal
    qq
    wechat-uos
    discord
    dissent
    polari
    # Email
    thunderbird
    # Password Manager
    bitwarden
    bitwarden-cli
    # Music
    g4music
    ncmpcpp
    ncspot
    go-musicfox
    # RSS
    newsflash
    # Media
    komikku
    shortwave
    vlc
    (mpv-unwrapped.wrapper { mpv = mpv-unwrapped.override { cddaSupport = true; }; })
    # CD/DVD
    brasero
    # Games
    osu-lazer-bin
    lunar-client
    (lutris.override {
      extraPkgs = pkgs: [
        # List package dependencies here
        wineWowPackages.stable
        wineWowPackages.waylandFull
        pixman
        libjpeg
        zenity
        winetricks
        umu-launcher
      ];
    })
    umu-launcher
    bottles
    # IDE
    lapce
    zed-editor
    github-desktop
    # Network
    wireshark-qt
    # Todo
    kuro
    # Writing Tools
    logseq
    obsidian
    marktext
    rnote
    papers
    # Office Toolkits
    wpsoffice-cn
    libreoffice
    # File Searching
    fsearch
    # Bittorrent
    fragments
    # Kdenlive
    kdePackages.kdenlive
    frei0r
    mediainfo
    # File Sharing
    localsend
    nur.repos.rewine.landrop
    # Remote Desktop
    rustdesk
    parsec-bin
    remmina
    moonlight-qt
    # Virt Manager
    virt-manager
    looking-glass-client
    # Radio
    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.gqrx
    # Screenshot
    flameshot
    # Screenkey
    showmethekey
    # Uxplay
    uxplay
    # Backup
    pika-backup
    # Gnome Cicle Apps
    metadata-cleaner
    gnome-decoder
    video-trimmer
    raider
    dialect
    eyedropper
    collision
    # Dconf
    dconf-editor
  ];
}
