{
  description = "ChaosAttractor's NixOS Flake";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    # Nix Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware";
    # lanzaboote (Secure boot)
    lanzaboote.url = "github:nix-community/lanzaboote";
    # User Packages
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # NUR Packages
    nur.url = "github:nix-community/NUR";
    # Apple Silicon Support
    apple-silicon-support.url = "github:tpwrules/nixos-apple-silicon";
    # Agenix
    agenix.url = "github:ryantm/agenix";
    # AAGL
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    # firefox-gnome-theme
    firefox-gnome-theme = { url = "github:rafaelmardojai/firefox-gnome-theme"; flake = false; };
  };

  outputs = inputs @ { self, nixpkgs, nixos-hardware, lanzaboote, home-manager, nur, apple-silicon-support, agenix, aagl, firefox-gnome-theme, ... }:
  let
    user = "lostattractor";
  in
  {
    nixosConfigurations = {
      # Lneovo Legion R9000P
      "CALaptopR9000P" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit inputs user system; };
        modules = [
          ./configuration.nix
          ./specific/system-specific/CALaptopR9000P
          ./specific/hardware-specific/lenovo-legion-16ach6h
          ./specific/user-specific
          ./lanzaboote.nix
          ./home-manager.nix
          nixos-hardware.nixosModules.lenovo-legion-16ach6h  # hardware.nvidia.prime.offload.enable may cause xorg crash
          lanzaboote.nixosModules.lanzaboote
          nur.nixosModules.nur
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          aagl.nixosModules.default
        ];
      };
      # Zephyrus G14
      "CALaptopG14" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit inputs user system; };
        modules = [
          ./configuration.nix
          ./specific/system-specific/CALaptopG14
          ./specific/hardware-specific/asus-zephyrus-ga401
          ./specific/user-specific
          ./lanzaboote.nix
          ./home-manager.nix
          nixos-hardware.nixosModules.asus-zephyrus-ga401
          lanzaboote.nixosModules.lanzaboote
          nur.nixosModules.nur
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
          aagl.nixosModules.default
        ];
      };
      # CAAppleSilicon
      "CAAppleSilicon" = nixpkgs.lib.nixosSystem rec {
        system = "aarch64-linux";
        specialArgs = { inherit inputs user system; };
        modules = [
          ./configuration.nix
          ./specific/system-specific/CAAppleSilicon
          ./specific/hardware-specific/apple-silicon
          ./specific/user-specific
          apple-silicon-support.nixosModules.apple-silicon-support
          nur.nixosModules.nur
          home-manager.nixosModules.home-manager
          agenix.nixosModules.default
        ];
      };
    };
    hydraJobs = {
      nixosConfigurations = nixpkgs.lib.mapAttrs' (name: config:
        nixpkgs.lib.nameValuePair name config.config.system.build.toplevel)
        self.nixosConfigurations;
    };
  };
}
