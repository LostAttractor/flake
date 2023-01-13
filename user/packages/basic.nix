{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox-wayland #firefox
    chromium
    # (chromium.override {
    #   commandLineArgs = [
    #     "--use-angle=egl"
    #     "--use-cmd-decoder=passthrough"
    #   ];
    # })
    # microsoft-edge
    tdesktop
    # qq
    # (makeAutostartItem { name = "org.telegram.desktop"; package = tdesktop; })
    # (makeAutostartItem { name = "qq"; package = qq; })
    (pkgs.callPackage ../../userrepo/makeAutostartItem { name = "org.telegram.desktop"; package = tdesktop; commandLineArgs = "-startintray"; })
    signal-desktop
    discord
    # keeweb
  ];
}