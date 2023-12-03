{ pkgs, ... }:
{
  # Firewall Ports
  # 3389  RDP        TCP
  # 15234 Landrop    TCP
  # 51820 Wireguard  UDP (Configured via NetworkManager)

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 15234 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Open Kde Connect Port
  programs.kdeconnect = {
	  enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

}