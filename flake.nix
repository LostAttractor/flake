{
  description = "ChaosAttractor's NixOS Flake";

  inputs = {
    # Nix Packages
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs.url = "github:lostattractor/nixpkgs/nixos-unstable-small-custom";
    # nixpkgs.url = "github:lostattractor/nixpkgs/master-custom";
    # Nix Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware";
    # lanzaboote
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
      nixosConfigurations."CALaptopR9000P" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.lenovo-legion-16ach6h   
          # hardware.nvidia.prime.offload.enable may cause xorg crash
          # Secure boot
          ./lanzaboote.nix
          lanzaboote.nixosModules.lanzaboote
          # NUR
          nur.nixosModules.nur
          # Home-Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs user; };
            home-manager.users.${user} = import ./user/home.nix;
          }
          ({ config, ... }: {
            networking.hostName = "CALaptopR9000P"; # Define hostname.

            # Packages form NUR
            home-manager.users.${user} = {
              home.packages = [
                config.nur.repos.rewine.landrop
                config.nur.repos.xddxdd.wechat-uos
                # config.nur.repos.linyinfeng.icalingua-plus-plus
              ];
            };
          })
        ];
      };
    };
}
