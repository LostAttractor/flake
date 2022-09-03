{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        (pkgs.callPackage ./kuro/default.nix { })
    ];
}