{ config, ... }:
{
  services.rathole = {
    enable = true;
    role = "client";
    credentialsFile = config.sops.templates."rathole".path;
    settings.client = {
      remote_addr = "lostattractor.net:3344";
      services.CALaptopG14_ssh.local_addr = "127.0.0.1:22";
    };
  };

  sops.templates."rathole".content = ''
    [client.services.CALaptopG14_ssh]
    # Must be the same with the server to pass the validation
    token = "${config.sops.placeholder."rathole/token"}"
  '';

  sops.secrets."rathole/token" = { };
}
