{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Terminal
    (blackbox-terminal.override { sixelSupport = true; })
    # Web Browser
    chromium
    # Social Apps
    tdesktop
    signal-desktop
    element-desktop
    cinny-desktop
    fractal
    qq
    wechat-uos
    discord
    # Password Manager
    bitwarden
    # Music
    g4music
    yesplaymusic
    ncmpcpp
    ncspot
    # RSS
    newsflash
    # Media
    komikku
    shortwave
    # Games
    osu-lazer-bin
    lunar-client
    lutris
    # IDE
    lapce
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
    dialect
    eyedropper
    # Broken Apps
    # collision
  ];
}