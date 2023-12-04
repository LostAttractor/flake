{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Web Browser
    firefox
    chromium
    # Social Apps
    tdesktop
    signal-desktop
    element-desktop
    cinny-desktop
    fractal-next
    qq
    (discord.override { nss = nss_latest; })
    # Password Manager
    bitwarden
  ];
}