{ pkgs, ... }:
{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 15234 ]; # landrop
  networking.firewall.allowedUDPPorts = [ 15234 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  programs.kdeconnect = {
	  enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  }; # Open Kde Connect Port

  # Enable V2rayA
  services.v2raya.enable = true;

  # Network Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}