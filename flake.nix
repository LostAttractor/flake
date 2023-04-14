{
  description = "ChaosAttractor's NixOS Flake";

  inputs = {
    # Nix Packages
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs.url = "github:lostattractor/nixpkgs/nixos-unstable-small-testing";
    # nixpkgs.url = "github:lostattractor/nixpkgs/master-testing";
    # Nix Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware";
    # lanzaboote (Secure boot)
    lanzaboote.url = "github:nix-community/lanzaboote";
    # User Packages
    home-manager.url = "github:nix-community/home-manager";
    # NUR Packages
    nur.url = "github:nix-community/NUR";
    # Apple Silicon Support
    apple-silicon-support.url = "github:tpwrules/nixos-apple-silicon";
  };

  outputs = inputs @ { nixpkgs, nixos-hardware, lanzaboote, home-manager, nur, apple-silicon-support, ... }:
    let
      user = "lostattractor";
    in
    {
      # Lneovo Legion R9000P
      nixosConfigurations."CALaptopR9000P" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
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
        ];
      };
      # Zephyrus G14
      nixosConfigurations."CALaptopG14" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
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
        ];
      };
      # CALaptopM2
      nixosConfigurations."CALaptopM2" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
        modules = [
          ./configuration.nix
          ./specific/system-specific/CALaptopM2
          ./specific/user-specific
          apple-silicon-support.nixosModules.apple-silicon-support
          nur.nixosModules.nur
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
