{ config, pkgs, ... }:
{
  imports = [ 
	  ./sharing.nix
  ];

  programs.sharing.enable = true;
}