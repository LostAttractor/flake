{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    hyfetch
    screenfetch
    cmatrix
    v2ray
    ffmpeg-full
    appimage-run
    virt-manager
    rsync
    fsearch
    fragments
    you-get
    handlr
    xdotool
    you-get
    (pkgs.callPackage ./sharing { })
  ];

  imports = [
    ./rime.nix
    ./alacritty
  ];
}