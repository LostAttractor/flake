{ pkgs, ... }:
{
  # WireGuard Port
  networking.firewall.allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  
  # Enable WireGuard
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.100.0.2/32" ];
      listenPort = 51820;
      privateKeyFile = "/etc/wireguard-keys/private";

      peers = [
        {
          presharedKeyFile = "/etc/wireguard-keys/preshared";
          publicKey = "bdGvsxgXLQ7If+Ay7DxVMHRHBnMlKKZPAh6An5jQ3Eg=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "openwrt.lostattractor.net:51820";
          dynamicEndpointRefreshSeconds = 5;
        }
      ];
    };
  };
}