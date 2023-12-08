{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Music
    g4music
    yesplaymusic
    ncmpcpp
    spotify-tui
    ncspot
    # RSS
    newsflash
    # Media
    komikku
    shortwave
  ];

  imports = [ 
    ./spicetify.nix
  ];
}