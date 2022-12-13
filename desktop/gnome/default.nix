{ config, pkgs, ... }:
{
  imports = [ 
	./gnome.nix
    ./gnome-tweaks.nix
    ./gnome-wayland.nix
  ];
}