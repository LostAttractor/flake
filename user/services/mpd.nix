{ config, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = config.xdg.userDirs.music;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
  };
}