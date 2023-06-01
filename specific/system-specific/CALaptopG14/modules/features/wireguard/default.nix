{ ... }:
{
  # Wireguard IPv4 Segment: 10.100.0.1/24
  # Wireguard IPv6 ULA: fdfe:be36:2f43::/48
  # WireGuard Port: 51820
  # Lan IPv6 ULA: fdef:7ef9:ef2b::/48 (Dnsmasq/SmartDNS only listens the requests to this IP)
  networking.firewall.allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  
  # Enable WireGuard
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.100.0.2/24" "fdfe:be36:2f43::2/48" ];
      dns = [ "192.168.8.1" "fdef:7ef9:ef2b::1" ];
      privateKeyFile = "/etc/wireguard-keys/private";
      mtu = 1280;
      
      peers = [
        {
          presharedKeyFile = "/etc/wireguard-keys/preshared";
          publicKey = "pMqOmNOKEK/aO1ciZGV/wvYbT9LLdjwiQRV4mj8MWBY=";
          allowedIPs = [ "192.168.8.0/24" "10.100.0.0/24" "fdfe:be36:2f43::/48" "fdef:7ef9:ef2b::/48" ];
          # allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "openwrt.lostattractor.net:51820";
        }
      ];
    };
  };
}