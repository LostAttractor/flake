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
  };

  outputs = inputs @ { nixpkgs, nixos-hardware, lanzaboote, home-manager, nur, ... }:
    let
      user = "lostattractor";
    in
    {
      # Lneovo Legion R9000P
      nixosConfigurations."CALaptopR9000P" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
        modules = [
          ./configuration.nix
          ./system-specific/CALaptopR9000P
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
          ./system-specific/CALaptopG14
          ./lanzaboote.nix
          ./home-manager.nix
          nixos-hardware.nixosModules.asus-zephyrus-ga401   
          lanzaboote.nixosModules.lanzaboote
          nur.nixosModules.nur
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
