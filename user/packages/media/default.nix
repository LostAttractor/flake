{ pkgs, ...}:
{
  home.packages = with pkgs; [
    # Music
    g4music
    yesplaymusic
    # RSS
    newsflash
    # Media
    komikku
    shortwave
  ];

  imports = [ 
    ./spotify 
  ];
}