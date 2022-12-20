{
  description = "ChaosAttractor's NixOS Flake";

  inputs = {
      # Nix Packages
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      # User Packages
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # NUR Packages
      nur = {
        url = "github:nix-community/NUR";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      # Nix Hardware
      nixos-hardware.url = "github:nixos/nixos-hardware";
    };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, nixos-hardware, ... }: # Function that tells my flake which to use and what do what to do with the dependencies.
    let
      user = "lostattractor";
    in
    {
      nixosConfigurations."CALaptop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs user; };
        modules = [
          ./configuration.nix
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
          # Config
          ({ config, ... }: {
            # Packages form NUR
            home-manager.users.${user} = { ... }: {
              home.packages = [
                config.nur.repos.rewine.landrop
                config.nur.repos.xddxdd.wechat-uos-bin
                config.nur.repos.linyinfeng.icalingua-plus-plus
              ];
            };
          })
        ];
      };
    };
}
