{ pkgs, ... }:
{
  home.packages = with pkgs; [
    logseq
    obsidian
    wpsoffice-cn
    libreoffice
    marktext
    kuro
  ];

  imports = [
    ./mediaediting
  ];
}