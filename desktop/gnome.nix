{ config, pkgs, ... }:
{
	services.xserver.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
	services.xserver.displayManager.gdm.enable = true;
	
	environment.gnome.excludePackages = (with pkgs; [
		gnome-photos
		gnome-tour
	]) ++ (with pkgs.gnome; [
		cheese # webcam tool
		gnome-music
		gedit # text editor
		epiphany # web browser
		geary # email reader
		evince # document viewer
		gnome-characters
		totem # video player
		tali # poker game
		iagno # go game
		hitori # sudoku game
		atomix # puzzle game
		yelp
	]);

	services.xserver.displayManager.gdm.wayland = true;
}
