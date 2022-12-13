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
    };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, ... }: # Function that tells my flake which to use and what do what to do with the dependencies.
    let
      user = "lostattractor";
    in
    {
      nixosConfigurations."CALaptop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit nur; };
        modules = [
          ./configuration.nix          
          # Enable NUR
          nur.nixosModules.nur
          # Home-Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit user; };
            home-manager.users.lostattractor = import ./users/lostattractor/home.nix;
          }
          # Config
          ({ config, ... }: {
            # Packages form NUR
            home-manager.users.lostattractor = { ... }: {
              home.packages = [
                config.nur.repos.YisuiMilena.hyfetch
                config.nur.repos.rewine.landrop
                # config.nur.repos.xddxdd.wechat-uos-bin
                config.nur.repos.linyinfeng.icalingua-plus-plus
              ];
            };
          })
        ];
      };
    };
}
