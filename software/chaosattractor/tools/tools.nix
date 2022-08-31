{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            neofetch
            screenfetch
            cmatrix
            v2ray
            ffmpeg
            appimage-run
            nur.repos.YisuiMilena.hyfetch
            nur.repos.rewine.landrop
        ];
    };
}