{ config, pkgs, ... }:
{
  imports = [ 
	  ./sharing.nix
  ];

  programs.sharing.enable = true;

  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ./keeweb { nss = nss_latest; })
  ];
}