{
  pkgs,
  lib,
  options,
  user,
  ...
}:
{
  config =
    {
      environment.gnome.excludePackages = with pkgs; [
        gnome-tour
        epiphany
      ];

      # Open Firewall for Gnome Remote Display
      networking.firewall.allowedTCPPorts = [ 3389 ];

      # Open Firewall for gsconnect
      programs.kdeconnect = {
        enable = true;
        package = pkgs.gnomeExtensions.gsconnect;
      };
    }
    // lib.optionalAttrs (builtins.hasAttr "home-manager" options) {
      home-manager.users.${user} = import ../../../user/desktop/gnome;
    };
}
