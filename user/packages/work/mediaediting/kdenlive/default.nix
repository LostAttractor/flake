{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdenlive
    frei0r
    mediainfo
  ];
}