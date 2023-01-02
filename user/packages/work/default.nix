{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    logseq
    obsidian
    wpsoffice-cn
    # xmind
    marktext
  ];

  imports = [
    ./mediaediting/mediaediting.nix
    # ./kuro/kuro.nix
  ];
}