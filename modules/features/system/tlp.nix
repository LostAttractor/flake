{ config, pkgs, lib, ... }:
{
  #I currently use tlp.service and powertop.service simultaneously, it's aggressive powersaving and on my LG Gram, I am getting around 13 hours of battery life compared to the 10.5 hours of gnome profile manager. I haven't faced any issues with tlp and powertop on my fedora silverblue installation. GNOME power profiles manager is okay, but it's not as convinient as a systemctl service like tlp and powertop which is auto started where as you have to manually set gnome power profiles to power saver each time on boot.
  # powerManagement.powertop.enable = true;

  # TLP
  services.power-profiles-daemon.enable = lib.mkForce false;   # Disable Gnome Power-Profiles-Daemon
  services.tlp.enable = true;
}
