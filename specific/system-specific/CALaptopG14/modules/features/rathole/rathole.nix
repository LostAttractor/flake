{ config, lib, pkgs, ... }: 
{
  options.services.rathole = {
    enable = lib.mkEnableOption "rathole";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.rathole;
      defaultText = "pkgs.rathole";
      description = ''
        Rathole package to use.
      '';
    };
    configFile = lib.mkOption {
      type = lib.types.path;
      description = ''
        Configuration file for rathole.
      '';
    };
  };
  config = lib.mkIf config.services.rathole.enable {
    systemd.services.rathole = {
      description = "Rathole Services";
      wantedBy = ["multi-user.target"];
      unitConfig.After = [ "network.target" ];

      serviceConfig = {
        Restart = "on-failure";
        RestartSec= 5;
        DynamicUser = true;
        LimitNOFILE=1048576;
        LoadCredential = "rathole.toml:${config.services.rathole.configFile}";
        ExecStart = ''${pkgs.rathole}/bin/rathole "''${CREDENTIALS_DIRECTORY}/rathole.toml"'';
      };
    };
  };
}