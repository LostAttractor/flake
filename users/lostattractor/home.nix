{ config, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.stateVersion = "22.11";
  
  # Package
  imports = [
    ./fish/fish.nix
    ./package/basic.nix
    ./package/tools/tools.nix
    ./package/work/work.nix
    ./package/develop/develop.nix
    ./package/games/games.nix
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
