{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        kdenlive
        ffmpeg-full
        frei0r
        mediainfo
    ];
}