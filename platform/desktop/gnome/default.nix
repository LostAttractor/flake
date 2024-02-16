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

  environment.systemPackages = with pkgs; [
    (blackbox-terminal.override { sixelSupport = true; })
  ];

  # Enable Firewall for Gnome Remote Display
  networking.firewall.allowedTCPPorts = [ 3389 ];
}