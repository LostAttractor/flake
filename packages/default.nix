{ config, pkgs, ... }:
{
  imports = [ 
	  ./basic.nix
    ./develop.nix
    ./steam.nix
  ];
}