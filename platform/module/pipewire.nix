{ config, pkgs, ... }:
{
  # PulseAudio
  #sound.enable = true; #Enable sound.
  #hardware.pulseaudio.enable = true;

  # Pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  hardware.bluetooth.enable = true;
}
