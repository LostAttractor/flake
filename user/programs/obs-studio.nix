{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-ndi
      obs-text-pthread
      obs-vkcapture
      waveform
      # Plugins that no longer in use
      # obs-multi-rtmp
    ];
  };
}