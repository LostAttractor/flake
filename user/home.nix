{ config, ... }:
{
  programs.home-manager.enable = true;
  
  imports = [
    ./settings/shell
    ./settings/i18n
    ./settings/fonts
    ./settings/gnome-tweaks
    ./settings/firefox
    ./settings/flatpak
    ./settings/hidpi
    ./packages
  ];

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;
}
