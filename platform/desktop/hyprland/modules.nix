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
      environment.systemPackages = with pkgs; [ adwaita-icon-theme ];

      services.gvfs.enable = true;

      services.gnome.gnome-keyring.enable = true;
      programs.gnupg.agent.pinentryPackage = pkgs.pinentry-gnome3; # need gcr
    }
    // lib.optionalAttrs (options ? home-manager) {
      home-manager.users.${user} = import ../../../user/desktop/hyprland;
    };
}
