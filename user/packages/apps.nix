{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Web Browser
    chromium
    # Social Apps
    tdesktop
    signal-desktop
    element-desktop
    cinny-desktop
    fractal
    qq
    discord
    # Password Manager
    bitwarden
    # Music
    g4music
    yesplaymusic
    ncmpcpp
    spotify-tui
    ncspot
    # RSS
    newsflash
    # Media
    komikku
    shortwave
    # Games
    osu-lazer-bin
    lunar-client
    protonup-ng
    lutris
    yuzu-early-access
    # IDE
    lapce
    github-desktop
    # Todo
    kuro
    # Writing Tools
    logseq
    obsidian
    marktext
    # Office Toolkits
    wpsoffice-cn
    libreoffice
    # File Searching
    fsearch
    # Bittorrent
    fragments
    # Kdenlive
    kdenlive
    frei0r
    mediainfo
    # File Sharing
    localsend
    pkgs.nur.repos.rewine.landrop
    # Remote Desktop
    rustdesk
    parsec-bin
    # Virt Manager
    virt-manager
    looking-glass-client
    # Screenshot
    flameshot
    # Uxplay
    uxplay
    # Gnome Cicle Apps
    metadata-cleaner
    gnome-decoder
    video-trimmer
    raider
    collision
    dialect
    eyedropper
  ];
}