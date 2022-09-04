{ config, pkgs, ... }:
{
	environment.systemPackages = (with pkgs; [ 
		papirus-icon-theme
        orchis-theme
	]) ++ (with pkgs.gnome; [
		gnome-tweaks
		gnome-todo
		dconf-editor
		gnome-power-manager
		gnome-sound-recorder
	]) ++ (with pkgs.gnomeExtensions; [
		appindicator
		gsconnect
		clipboard-history
		blur-my-shell
		dock-from-dash
		openweather
		hibernate-status-button
		ibus-tweaker
	]);

	services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
	services.packagekit.enable = true;

	programs.kdeconnect = {
		enable = true;
		package = pkgs.gnomeExtensions.gsconnect;
	}; #开放网络端口

	services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
		[org.gnome.desktop.interface]
		gtk-theme='Orchis-Purple-Dark'
	'';
	environment.sessionVariables = {
        GTK_THEME = "Orchis-Purple-Dark";
    };
}