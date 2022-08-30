{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [ 
		gnome.gnome-tweaks
		gnome.gnome-todo
		gnome.dconf-editor
		gnome.gnome-power-manager
		gnome.gnome-sound-recorder

		gnomeExtensions.appindicator
		gnomeExtensions.gsconnect
		gnomeExtensions.clipboard-history
		gnomeExtensions.blur-my-shell
		gnomeExtensions.dock-from-dash

		papirus-icon-theme
        orchis-theme
	];

	services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
	services.packagekit.enable = true;

	programs.kdeconnect = {
		enable = true;
		package = pkgs.gnomeExtensions.gsconnect;
	};

	services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
		[org.gnome.desktop.interface]
		gtk-theme='Orchis-Purple-Dark'
	'';
	environment.sessionVariables = {
        GTK_THEME = "Orchis-Purple-Dark";
    };
}