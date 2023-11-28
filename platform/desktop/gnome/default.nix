{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    epiphany # web browser
  ]);

  # Enable Wayland for Chromium (CEF) Apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix that some apps cannot open links
  xdg.portal.xdgOpenUsePortal = true; 

  # Enable Firewall for Gnome Remote Display
  networking.firewall.allowedTCPPorts = [ 3389 ];

  imports = [
    # platform/modules/basic
    ../../modules/fonts.nix
    # platform/modules/hardware
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/gamepad.nix
    ../../modules/hardware/mobiledevice.nix
    # platform/modules/features
    ../../modules/features/pipewire.nix
    ../../modules/features/printing.nix
  ];
}