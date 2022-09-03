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
        
        handlr
        #xdg-launch
        #nur.repos.YisuiMilena.hyfetch
        #nur.repos.rewine.landrop
    ];

    imports = [
        ./alacritty/alacritty.nix
    ];
}