{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            kdenlive
            ffmpeg-full
            frei0r
            mediainfo
        ];
    };
}