{ pkgs, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify =
    {
      # Spotify Adblocked
      spotifyPackage = pkgs.callPackage ../../../../userrepo/spotify { spotify-adblock = (pkgs.callPackage ../../../../userrepo/spotify-adblock { }); };
      windowManagerPatch = false;

      enable = true;
      theme = spicePkgs.themes.Sleek;
      colorScheme = "cherry";

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
      ];
    };
}