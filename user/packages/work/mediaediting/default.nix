{ pkgs, ... }:
{  
  home.packages = with pkgs; [
    aegisub
    handbrake
    audacity
    gimp
  ];

  imports = [
    ./obs-studio
    ./kdenlive
  ];
}