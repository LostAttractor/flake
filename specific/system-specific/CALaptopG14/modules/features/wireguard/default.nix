{ ... }:
{
  # Wireguard IPv4 Segment: 10.100.0.1/24
  # Wireguard IPv6 ULA: fdfe:be36:2f43::/48
  # WireGuard Port: 51820
  # Lan IPv6 ULA: fd42:208c:df86::1/60 (Dnsmasq/SmartDNS only listens the requests to this IP)
  networking.firewall.allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  
  # Enable WireGuard
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.100.0.2/24" "fdfe:be36:2f43::2/48" ];
      dns = [ "192.168.8.1" "fd42:208c:df86::1" ];
      privateKeyFile = "/etc/wireguard-keys/private";
      mtu = 1280;
      
      peers = [
        {
          presharedKeyFile = "/etc/wireguard-keys/preshared";
          publicKey = "V+61VIOrIHUTP39f0srbXSTA1EhW1kDJ8kFROI/GWVk=";
          allowedIPs = [ "192.168.0.0/16" "10.100.0.0/24" "fdbf:0ccb:a42f::/48" "fd42:208c:df86::1/60" ];
          # allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "openwrt.lostattractor.net:51820";
        }
      ];
    };
  };

  # networking.wireguard.interfaces = {
  #   wg0 = {
  #     ips = [ "10.100.0.2/24" "fdfe:be36:2f43::2/48" ];
  #     listenPort = 51820;
  #     privateKeyFile = "/etc/wireguard-keys/private";

  #     peers = [
  #       {
  #         presharedKeyFile = "/etc/wireguard-keys/preshared";
  #         publicKey = "V+61VIOrIHUTP39f0srbXSTA1EhW1kDJ8kFROI/GWVk=";
  #         allowedIPs = [ "192.168.0.0/16" "10.100.0.0/24" "fdbf:0ccb:a42f::/48" "fd42:208c:df86::1/60" ];
  ##        allowedIPs = [ "0.0.0.0/0" "::/0" ];
  #         endpoint = "openwrt.lostattractor.net:51820";
  #         dynamicEndpointRefreshSeconds = 5;
  #       }
  #     ];
  #   };
  # };
}