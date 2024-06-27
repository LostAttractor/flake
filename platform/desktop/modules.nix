_: {
  imports = [
    # platform/modules/basic
    ../modules/fonts.nix
    # platform/modules/hardware
    ../modules/hardware/bluetooth.nix
    ../modules/hardware/gamepad.nix
    ../modules/hardware/mobiledevice.nix
    # platform/modules/features
    ../modules/features/pipewire.nix
    ../modules/features/fcitx5.nix
    ../modules/features/avahi.nix
    ../modules/features/printing.nix
    ../modules/features/flatpak.nix
  ];
}
