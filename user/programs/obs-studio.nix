{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      # Plugins that no longer in use
      # obs-multi-rtmp
    ];
  };
}