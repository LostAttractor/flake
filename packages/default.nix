{ config, pkgs, ... }:
{
  imports = [ 
	  ./basic.nix
    ./develop.nix
    ./gaming.nix
  ];
}