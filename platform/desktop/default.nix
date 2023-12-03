_:
{
  imports = [
    # Using Gnome by default
    ./gnome
    # platform/modules/basic
    ../modules/fonts.nix
    # platform/modules/hardware
    ../modules/hardware/bluetooth.nix
    ../modules/hardware/gamepad.nix
    ../modules/hardware/mobiledevice.nix
    # platform/modules/features
    ../modules/features/pipewire.nix
    ../modules/features/avahi.nix
    ../modules/features/printing.nix
    ../modules/features/flatpak.nix
  ];

  specialisation."Hyprland".configuration = {
    system.nixos.tags = [ "Hyprland" ];
    imports = [ ./hyprland ];
    disabledModules = [ ./gnome ];
  };
}