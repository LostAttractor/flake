{ config, ... }:
{
  programs.home-manager.enable = true;
  
  imports = [
    ./settings/shell
    ./settings/gnome-tweaks
    ./settings/flatpak
    ./packages
  ];

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;
}
