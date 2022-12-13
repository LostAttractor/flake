{ config, pkgs, ... }:
{
  programs.kdeconnect = {
	enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  }; # Open Kde Connect Port

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Enable V2rayA
  services.v2raya.enable = true;
}