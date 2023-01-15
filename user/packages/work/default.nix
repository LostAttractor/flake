{ pkgs, ... }:
{
  home.packages = with pkgs; [
    logseq
    obsidian
    wpsoffice-cn
    libreoffice
    # xmind
    marktext
  ];

  imports = [
    ./mediaediting/mediaediting.nix
    # ./kuro/kuro.nix
  ];
}