{ pkgs, ... }:
{
  imports = [ 
	  ./gnome.nix
    ./xorg.nix
    ./wayland.nix
    ./xdg.nix
  ];
}