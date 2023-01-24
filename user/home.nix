{ config, ... }:
{
  programs.home-manager.enable = true;
  
  imports = [
    ./modules/shell
    ./modules/gnome-tweaks
    ./modules/flatpak
    ./packages
  ];

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;
}
