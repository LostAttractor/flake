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

  # Enable Wayland for QT and Chromium Apps
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
  };

  # Fix that some apps cannot open links
  xdg.portal = { 
    enable = true;
    xdgOpenUsePortal = true; 
  };

  # Enable Firewall for Gnome Remote Display
  networking.firewall.allowedTCPPorts = [ 3389 ];
}
