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
    keeweb
  ];

  home.sessionVariables = {
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };
}