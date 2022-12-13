{ config, pkgs, ... }:
{
  imports = [ 
	./basic.nix
    ./develop.nix
    ./steam.nix
  ];

  # Enable V2rayA
  services.v2raya.enable = true;
}