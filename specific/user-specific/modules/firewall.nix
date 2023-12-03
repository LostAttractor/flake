{ pkgs, ... }:
{
  # Firewall Ports
  # 3389  RDP        TCP
  # 15234 Landrop    TCP
  # 7000  Uxplay     TCP
  # 7100  Uxplay     TCP
  # 6000  Uxplay     UDP
  # 6001  Uxplay     UDP
  # 7011  Uxplay     UDP
  # 51820 Wireguard  UDP (Configured via NetworkManager)

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 15234 7000 7100 ];
  networking.firewall.allowedUDPPorts = [ 6000 6001 7011 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Open Kde Connect Port
  programs.kdeconnect = {
	  enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

}