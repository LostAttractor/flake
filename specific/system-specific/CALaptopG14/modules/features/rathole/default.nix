{ config, ... }:
{
  imports = [ ./rathole.nix ];
  
  services.rathole.enable = true;
  services.rathole.configFile =  config.sops.templates."rathole".path;

  sops.templates."rathole".content = ''
    [client]
    remote_addr = "lostattractor.net:3344" # The address of the server. The port must be the same with the port in `server.bind_addr`

    [client.services.CALaptopG14_ssh]
    token = "${config.sops.placeholder."rathole/token"}" # Must be the same with the server to pass the validation
    local_addr = "127.0.0.1:22" # The address of the service that needs to be forwarded
  '';

  sops.secrets."rathole/token" = {};
}