{ spotify, spotify-adblock, spotifywm }:
  spotify.overrideAttrs (
    old: {
      postInstall = (old.postInstall or "") + ''
        # wrap spotify to use spotifywm.so & libspotifyadblock.so
        wrapProgram $out/bin/spotify \
          --set LD_PRELOAD "${spotify-adblock}/lib/libspotifyadblock.so ${spotifywm}/lib/spotifywm.so"
      '';
    }
  )