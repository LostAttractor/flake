{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        neofetch
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
        #xdg-launch
        #nur.repos.YisuiMilena.hyfetch
        #nur.repos.rewine.landrop
    ];

    imports = [
        ./rime.nix
        ./alacritty/alacritty.nix
    ];
}