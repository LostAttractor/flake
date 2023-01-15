{ pkgs, ... }:
{
  imports = [ 
	  ./gnome.nix
    ./wayland.nix
    ./xdg.nix
  ];

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
	services.packagekit.enable = true;
}