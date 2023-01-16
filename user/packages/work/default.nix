{ pkgs, ... }:
{
  home.packages = with pkgs; [
    logseq
    obsidian
    wpsoffice-cn
    libreoffice
    # xmind
    marktext
    kuro
  ];

  imports = [
    ./mediaediting
  ];
}