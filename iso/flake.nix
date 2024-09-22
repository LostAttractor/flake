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
    # xivlauncher-rb
    nixos-xivlauncher-rb.url = "github:drakon64/nixos-xivlauncher-rb";
    nixos-xivlauncher-rb.inputs.nixpkgs.follows = "nixpkgs";
    # vscode-extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
    # flake-programs-sqlite
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";
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
          modules = with inputs; [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
            ./livecd.nix
            ../platform/desktop/gnome/modules.nix
            ../home-manager.nix
            home-manager.nixosModules.home-manager
            aagl.nixosModules.default
            daeuniverse.nixosModules.daed
            flake-programs-sqlite.nixosModules.programs-sqlite
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
        plasma6 = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs system;
            user = "nixos";
          };
          modules = with inputs; [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-plasma6.nix"
            ./livecd.nix
            ../home-manager.nix
            home-manager.nixosModules.home-manager
            aagl.nixosModules.default
            flake-programs-sqlite.nixosModules.programs-sqlite
            daeuniverse.nixosModules.daed
            { nixpkgs.config.allowUnfree = true; }
          ];
        };
      };
      hydraJobs.iso = nixpkgs.lib.mapAttrs' (
        name: config: nixpkgs.lib.nameValuePair name config.config.system.build.isoImage
      ) nixosConfigurations;
    };
}
