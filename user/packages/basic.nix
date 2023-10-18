{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Web Browser
    firefox-wayland # firefox for wayland
    chromium
    # microsoft-edge
    # Social Apps
    tdesktop
    signal-desktop
    element-desktop
    fractal-next
    qq
    (discord.override { nss = nss_latest; })
    # Password Manager
    (keeweb.override { nss = nss_latest; })
    bitwarden
    # Music Apps
    g4music
    yesplaymusic
    (pkgs.callPackage ../../userrepo/spotify-adblocked { })
    # Telegram Autostart
    (pkgs.callPackage ../../userrepo/makeAutostartItem { name = "org.telegram.desktop"; package = tdesktop; commandLineArgs = "-startintray"; })
  ];
}