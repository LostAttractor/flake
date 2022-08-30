{ config, pkgs, ... }:
{
	services.xserver.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	
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
		yelp
	]);

	services.xserver.displayManager.gdm.wayland = true;
}
