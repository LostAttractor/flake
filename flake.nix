{
    description = "ChaosAttractor's NixOS Flake";

    # 输入配置，即软件源
    inputs = {
        # Nixpkgs，即 NixOS 官方软件源
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        # 添加 NixOS CN 仓库
        nixos-cn.url = "github:nixos-cn/flakes";
        # 强制 nixos-cn 和该 flake 使用相同版本的 nixpkgs
        nixos-cn.inputs.nixpkgs.follows = "nixpkgs";
        # 添加 NUR 仓库
        nur.url = "github:nix-community/NUR";
        # 强制 NUR 和该 flake 使用相同版本的 nixpkgs
        nur.inputs.nixpkgs.follows = "nixpkgs";
    };

    # 输出配置，即 NixOS 系统配置
    outputs = inputs@{ nixpkgs, home-manager, nixos-cn, nur, ... }:
    let system = "x86_64-linux";
    in {
        nixosConfigurations."CALaptop" = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                ./configuration.nix
                # 启用 NUR
                nur.nixosModules.nur
                # 配置 Home-Manager
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.chaosattractor = import ./users/chaosattractor/home.nix;
                }
                # Config
                ({ config, ... }: {
                    # NixOS CN
                    # 使用 nixos-cn 的 binary cache
                    nix.settings.substituters = [ "https://nixos-cn.cachix.org" ];
                    nix.settings.trusted-public-keys = [ "nixos-cn.cachix.org-1:L0jEaL6w7kwQOPlLoCR3ADx+E3Q8SEFEcB9Jaibl0Xg=" ];

                    imports = [
                        # 将nixos-cn flake提供的registry添加到全局registry列表中
                        # 可在`nixos-rebuild switch`之后通过`nix registry list`查看
                        nixos-cn.nixosModules.nixos-cn-registries
                        # 引入nixos-cn flake提供的NixOS模块
                        nixos-cn.nixosModules.nixos-cn
                    ];

                    # 使用 nur & nixos-cn flake 提供的包
                    home-manager.users.chaosattractor = { ... }: {
                        home.packages = [
                            config.nur.repos.YisuiMilena.hyfetch
                            config.nur.repos.rewine.landrop
                            config.nur.repos.xddxdd.wechat-uos-bin
                            config.nur.repos.linyinfeng.icalingua-plus-plus
                            nixos-cn.legacyPackages.${system}.opendrop
                        ];
                    };
                })
            ];
        };
    };
}