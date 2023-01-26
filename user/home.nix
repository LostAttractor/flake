{ config, ... }:
{
  programs.home-manager.enable = true;
  
  imports = [
    ./settings/shell
    ./settings/gnome-tweaks
    ./settings/flatpak
    ./packages
  ];

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;
}
