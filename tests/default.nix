{ config, pkgs, ... }:
{
  imports = [ 
	  ../userrepo/sharing/module.nix
  ];

  programs.sharing.enable = true;

  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ../userrepo/keeweb { nss = nss_latest; })
  ];
}