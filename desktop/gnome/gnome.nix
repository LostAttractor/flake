{ config, pkgs, ... }:
{
	services.xserver = {
		enable = true;
		desktopManager.gnome.enable = true;
		displayManager.gdm.enable = true;
	};
	
	environment.gnome.excludePackages = (with pkgs; [
		gnome-photos
		gnome-tour
	]) ++ (with pkgs.gnome; [
		epiphany # web browser
		# geary # email reader
		evince # document viewer
		gnome-characters
		tali # poker game
		iagno # go game
		hitori # sudoku game
		atomix # puzzle game
		yelp
	]);
}
