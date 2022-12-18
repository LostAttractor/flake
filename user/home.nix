{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
  
  imports = [
    ./modules/shell
    ./modules/gnome-tweaks
    ./modules/flatpak
    ./packages
  ];

  home.file.".pam_environment".text = ''
    # -*- mode: sh -*-
    
    . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
  '';

  nixpkgs.config.allowUnfree = true;
}
