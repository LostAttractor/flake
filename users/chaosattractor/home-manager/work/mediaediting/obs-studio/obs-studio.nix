{ config, pkgs, ... }:
{  
    home.packages = (with pkgs; [
        obs-studio
    ]) ++ (with pkgs.obs-studio-plugins; [
        obs-multi-rtmp
        obs-pipewire-audio-capture
    ]);
}