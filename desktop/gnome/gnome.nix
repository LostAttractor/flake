{ pkgs, ... }:
{
  services = {
    xserver = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
	  packagekit.enable = true;
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
}
