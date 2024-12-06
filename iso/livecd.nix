_: {
  imports = [
    # desktop platform modules
    ../platform/desktop/modules.nix
    # modules/basic
    ../modules/time.nix
    ../modules/network.nix
    ../modules/shell.nix
    ../modules/nix.nix
    # modules/features
    ../modules/features/virtualisation.nix
    ../modules/features/docker.nix
    ../modules/features/appimage.nix
    # package
    ../packages
    ../packages/gaming.nix
  ];

  isoImage.squashfsCompression = "zstd";
}
