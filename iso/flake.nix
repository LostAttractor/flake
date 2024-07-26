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
    apple-silicon-support.inputs.nixpkgs.follows = "nixpkgs";
    # AAGL
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    # Spicetify
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    # daeuniverse
    daeuniverse.url = "github:daeuniverse/flake.nix";
    daeuniverse.inputs.nixpkgs.follows = "nixpkgs";
    # firefox-gnome-theme
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    rec {
      nixosConfigurations = {
        gnome = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs system;
            user = "nixos";
          };
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
            ./livecd.nix
            ../platform/desktop/gnome/modules.nix
            ../home-manager.nix
            ../platform/desktop/gnome/home-manager.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.aagl.nixosModules.default
            inputs.daeuniverse.nixosModules.daed
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
        plasma6 = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs system;
            user = "nixos";
          };
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma6.nix"
            ./livecd.nix
            ../home-manager.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.aagl.nixosModules.default
            inputs.daeuniverse.nixosModules.daed
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
      };
      hydraJobs.iso = nixpkgs.lib.mapAttrs' (
        name: config: nixpkgs.lib.nameValuePair name config.config.system.build.isoImage
      ) nixosConfigurations;
    };
}
