{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Music
    g4music
    yesplaymusic
    spotify-tui
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