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
    signal-desktop
    # qq
    keeweb
  ];
}