{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      # obs-multi-rtmp
      obs-pipewire-audio-capture
    ];
  };
}