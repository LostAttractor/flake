{
  description = "ChaosAttractor's NixOS Flake";

  inputs = {
    # Nix Packages
    nixpkgs.url = "github:lostattractor/nixpkgs/nixos-unstable-custom";
    # Nix Hardware
    nixos-hardware.url = "github:nixos/nixos-hardware";
    # User Packages
    home-manager.url = "github:nix-community/home-manager";
    # NUR Packages
    nur.url = "github:nix-community/NUR";
  };

  outputs = inputs @ { nixpkgs, nixos-hardware, home-manager, nur, ... }:
    let
      user = "lostattractor";
    in
    {
      nixosConfigurations."CALaptop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
        modules = [
          ./configuration.nix
          # Hardware
          # hardware.nvidia.prime.offload.enable may cause xorg crash
          nixos-hardware.nixosModules.lenovo-legion-16ach6h
          # Enable NUR
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
