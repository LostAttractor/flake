{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Web Browser
    firefox-wayland #firefox
    chromium
    # (chromium.override {
    #   commandLineArgs = [
    #     "--use-angle=egl"
    #     "--use-cmd-decoder=passthrough"
    #   ];
    # })
    # microsoft-edge
    # Social Apps
    tdesktop
    signal-desktop
    element-desktop
    fractal
    qq
    (discord.override { nss = nss_latest; })
    # Password Manager
    (keeweb.override { nss = nss_latest; })
    bitwarden
    # Music Apps
    yesplaymusic
    # Telegram Autostart
    (pkgs.callPackage ../../userrepo/makeAutostartItem { name = "org.telegram.desktop"; package = tdesktop; commandLineArgs = "-startintray"; })
  ];
}