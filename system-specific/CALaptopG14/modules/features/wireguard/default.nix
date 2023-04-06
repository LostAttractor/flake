{ ... }:
{
  # Wireguard IPv4 Segment: 10.100.0.1/24
  # Wireguard IPv6 ULA: fdfe:be36:2f43::/48
  # WireGuard Port: 51820
  networking.firewall.allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  
  # Enable WireGuard
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.100.0.2/24" "fdfe:be36:2f43::2/48" ];
      dns = [ "10.100.0.1" "fdfe:be36:2f43::1" ];
      privateKeyFile = "/etc/wireguard-keys/private";
      
      peers = [
        {
          presharedKeyFile = "/etc/wireguard-keys/preshared";
          publicKey = "bdGvsxgXLQ7If+Ay7DxVMHRHBnMlKKZPAh6An5jQ3Eg=";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "openwrt.lostattractor.net:51820";
        }
      ];
    };
  };

  # networking.wireguard.interfaces = {
  #   wg0 = {
  #     ips = [ "10.100.0.2/32" ];
  #     listenPort = 51820;
  #     privateKeyFile = "/etc/wireguard-keys/private";

  #     peers = [
  #       {
  #         presharedKeyFile = "/etc/wireguard-keys/preshared";
  #         publicKey = "bdGvsxgXLQ7If+Ay7DxVMHRHBnMlKKZPAh6An5jQ3Eg=";
  #         allowedIPs = [ "0.0.0.0/0" ];
  #         endpoint = "openwrt.lostattractor.net:51820";
  #         dynamicEndpointRefreshSeconds = 5;
  #       }
  #     ];
  #   };
  # };
}