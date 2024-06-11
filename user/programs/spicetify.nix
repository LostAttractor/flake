{ pkgs, inputs, config, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
  spotify-adblock = pkgs.callPackage ../../userrepo/spotify-adblock { };
in
{
  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify = {
    enable = true;
    dontInstall = true;
    windowManagerPatch = true;

    theme = spicePkgs.themes.Sleek;
    colorScheme = "cherry";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
    ];
  };

  home.packages = [
    (config.programs.spicetify.spicedSpotify.overrideAttrs (oldAttrs: {
      postInstall = oldAttrs.postInstall or "" + ''
        wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
          --set LD_PRELOAD "${spotify-adblock}/lib/libspotifyadblock.so"
      '';
    }))
  ];
}