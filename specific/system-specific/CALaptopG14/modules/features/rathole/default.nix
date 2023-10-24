{ config, ... }:
{
  imports = [ ./rathole.nix ];
  
  services.rathole.enable = true;
  services.rathole.configFile =  config.age.secrets.rathole.path;
}