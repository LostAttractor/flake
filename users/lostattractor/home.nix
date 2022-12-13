{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
  
  imports = [
    ./modules/fish
    ./modules/gnome-tweaks
    ./packages
  ];

  home.file.".pam_environment".text = ''
    # -*- mode: sh -*-
    
    . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
  '';

  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=/run/current-system/sw/share/X11/fonts:ro;/nix/store:ro;~/.local/share/fonts:ro
  '';

  nixpkgs.config.allowUnfree = true;
}
