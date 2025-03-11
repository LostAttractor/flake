_: {
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  # Pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    wireplumber.enable = true;

    extraConfig.pipewire."echo-cancel" = {
      # Echo cancellation
      "context.modules" = [
        {
          name = "libpipewire-module-echo-cancel";
          args = { 
            # Monitor mode: Instead of creating a virtual sink into which all
            # applications must play, in PipeWire the echo cancellation module can read
            # the audio that should be cancelled directly from the current fallback
            # audio output
            "monitor.mode" = true;
            # The audio source / microphone wherein the echo should be cancelled is not
            # specified explicitly; the module follows the fallback audio source setting
            "source.props" = {
                # Name and description of the virtual source where you get the audio
                # without echoed speaker output
                "node.name" = "source_ec";
                "node.description" = "Echo-cancelled source";
            };
            "aec.args" = {
              # Settings for the WebRTC echo cancellation engine
              # https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/spa/plugins/aec/aec-webrtc.cpp
              # "webrtc.gain_control" = true;
            };
          };
        }
      ];
    };
  };
}
