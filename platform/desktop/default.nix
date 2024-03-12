_:
{
  imports = [
    # Using Gnome by default
    ./gnome
    # Basic modules for desktop
    ./modules.nix
  ];

  specialisation."Hyprland".configuration = {
    system.nixos.tags = [ "Hyprland" ];
    imports = [ ./hyprland ];
    disabledModules = [ ./gnome ];
  };

  specialisation."Plasma".configuration = {
    system.nixos.tags = [ "Plasma" ];
    imports = [ ./plasma ];
    disabledModules = [ ./gnome ];
  };
}