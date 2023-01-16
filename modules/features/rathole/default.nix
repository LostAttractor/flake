{ pkgs, ... }:
let
  remote_addr = "lostattractor.net";
  remote_port = 3344;
  config = ''
    [client]
    remote_addr = "${remote_addr}:${toString remote_port}" # The address of the server. The port must be the same with the port in `server.bind_addr`

    [client.services.my_laptop_ssh]
    token = "${builtins.readFile ./token_mylaptop_ssh}" # Must be the same with the server to pass the validation
    local_addr = "127.0.0.1:22" # The address of the service that needs to be forwarded
  '';
in
{
  environment.systemPackages = with pkgs; [ rathole ];

  systemd.services.rathole =
    { description = "Rathole Services";
      wantedBy = [ "multi-user.target" ];
      unitConfig.After = [ "network.target" ];
      serviceConfig = {
        Type = "simple";
        DynamicUser = true;
        Restart= "on-failure";
        RestartSec= 5;
        ExecStart = "${pkgs.rathole}/bin/rathole /etc/rathole/config.toml";
        LimitNOFILE=1048576;
      };
    };

    environment.etc."rathole/config.toml".text = config;
}