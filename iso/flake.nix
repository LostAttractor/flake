{
  description = "ChaosAttractor's NixOS LiveCD Flake";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # User Packages
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # NUR Packages
    nur.url = "github:nix-community/NUR";
    # Apple Silicon Support
    apple-silicon-support.url = "github:tpwrules/nixos-apple-silicon";
    # AAGL
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    # firefox-gnome-theme
    firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme"; flake = false; };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, apple-silicon-support, aagl, spicetify-nix, firefox-gnome-theme, ... }: rec {
    # CALiveCD
    livecd = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = { inherit inputs system; user = "nixos"; };
      modules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
        ./livecd.nix
        ../home-manager.nix
        home-manager.nixosModules.home-manager
        aagl.nixosModules.default
        { nixpkgs.config.allowUnfree = true; }
      ];
    };
    hydraJobs.iso = livecd.config.system.build.isoImage;
  };
}