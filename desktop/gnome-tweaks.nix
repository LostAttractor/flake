{ config, pkgs, ... }:
{
	environment.systemPackages = (with pkgs; [ 
		papirus-icon-theme
        adw-gtk3
		(pkgs.callPackage ./layan-cursors { })
	]) ++ (with pkgs.gnome; [
		gnome-tweaks
		gnome-todo
		dconf-editor
		gnome-power-manager
		gnome-sound-recorder
	]) ++ (with pkgs.gnomeExtensions; [
		appindicator
		gsconnect
		# clipboard-history
		blur-my-shell
		dock-from-dash
		openweather
		hibernate-status-button
		ibus-tweaker
	]);

	services.xserver.displayManager.gdm.wayland = true;

	services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
	services.packagekit.enable = true;

	programs.kdeconnect = {
		enable = true;
		package = pkgs.gnomeExtensions.gsconnect;
	}; #开放网络端口

	services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
		[org.gnome.desktop.interface]
		gtk-theme='adw-gtk3-dark'
	'';
	# environment.sessionVariables = {
    #     GTK_THEME = "adw-gtk3-dark";
    # };
}