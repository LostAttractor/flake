{
  description = "ChaosAttractor's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  # 输出配置，即 NixOS 系统配置
  outputs = inputs@{ nixpkgs, home-manager, nur, ... }:
  let system = "x86_64-linux";
  in {
    nixosConfigurations."CALaptop" = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        # Home-Manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.lostattractor = import ./users/lostattractor/home.nix;
        }
        # Enable NUR
        nur.nixosModules.nur
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
