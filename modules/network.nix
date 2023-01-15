{ pkgs, ... }:
{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 15234 ]; # landrop
  networking.firewall.allowedUDPPorts = [ 15234 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable V2rayA
  services.v2raya.enable = true;

  programs.kdeconnect = {
	  enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  }; # Open Kde Connect Port
}