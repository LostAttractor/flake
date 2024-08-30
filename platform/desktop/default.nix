{ lib, ... }:
{
  imports = [
    # Using Gnome by default
    ./gnome
    # Basic modules for desktop
    ./modules.nix
  ];

  specialisation =
    lib.mapAttrs
      (name: config: {
        configuration = {
          system.nixos.tags = [ name ];
          disabledModules = [ ./gnome ];
        } // config;
      })
      {
        "Hyprland" = {
          imports = [ ./hyprland ];
        };
        "Plasma" = {
          imports = [ ./plasma ];
        };
      };
}
