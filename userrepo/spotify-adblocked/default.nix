{ stdenv,
  lib,
  rustPlatform, 
  fetchFromGitHub, 
  xorg, 
  spotify, 
  gnome, 
  deviceScaleFactor ? null
}: 

let
  spotify-adblock = rustPlatform.buildRustPackage {
    pname = "spotify-adblock";
    version = "1.0.2";
    src = fetchFromGitHub {
      owner = "abba23";
      repo = "spotify-adblock";
      rev = "v1.0.2";
      sha256 = "YGD3ymBZ2yT3vrcPRS9YXcljGNczJ1vCvAXz/k16r9Y=";
    };

    cargoSha256 = "bYqkCooBfGeHZHl2/9Om+0qbudyOCzpvwMhy8QCsPRE=";
  };

  spotifywm = stdenv.mkDerivation {
    name = "spotifywm";
    src = fetchFromGitHub {
      owner = "dasj";
      repo = "spotifywm";
      rev = "8624f539549973c124ed18753881045968881745";
      sha256 = "sha256-AsXqcoqUXUFxTG+G+31lm45gjP6qGohEnUSUtKypew0=";
    };
    buildInputs = [xorg.libX11];
    installPhase = ''
      mkdir -p $out/lib
      cp spotifywm.so $out/lib/
    '';
  };
in
  spotify.overrideAttrs (prev: {
    postInstall = ''
      libdir=$out/lib/spotify

      ln -s ${spotify-adblock}/lib/libspotifyadblock.so $libdir

      cp ${spotify-adblock.src}/config.toml $out

      wrapProgramShell $out/share/spotify/spotify \
        ''${gappsWrapperArgs[@]} \
        ${lib.optionalString (deviceScaleFactor != null) ''
          --add-flags "--force-device-scale-factor=${toString deviceScaleFactor}" \
        ''} \
        --prefix LD_LIBRARY_PATH : "$libdir" \
        --prefix PATH : "${gnome.zenity}/bin" \
        --prefix LD_PRELOAD : "${spotifywm}/lib/spotifywm.so" \
        --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--enable-features=UseOzonePlatform --ozone-platform=wayland}}"
    '';
  })