{ pkgs, ... }:
{
  # Open Firewall for Gnome Remote Display
  networking.firewall.allowedTCPPorts = [ 3389 ];

  # Open Firewall for gsconnect
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
