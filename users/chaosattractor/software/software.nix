{ config, pkgs, ... }:
{
    imports = [
        <home-manager/nixos>
        ./nur.nix
        ./basic.nix
        ./tools/tools.nix
        ./work/work.nix
        ./develop/develop.nix
        ./games/games.nix
    ];

    home-manager.useUserPackages = true;

    home-manager.users.chaosattractor = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;
    };
}