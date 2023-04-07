{ pkgs, ... }:
{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Firewall Ports
  # 15234 Landrop    TCP/UDP
  # 51820 Wireguard  UDP

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 15234 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Clamp MSS to PMTU
  networking.firewall.extraCommands = ''
    iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
  '';

  # Open Kde Connect Port
  programs.kdeconnect = {
	  enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # Network Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # V2rayA
  services.v2raya.enable = true;
}