_: {
  imports = [ ./gnome/home-manager.nix ];

  specialisation."Hyprland".configuration = {
    imports = [ ./hyprland/home-manager.nix ];
    disabledModules = [ ./gnome/home-manager.nix ];
  };
}
