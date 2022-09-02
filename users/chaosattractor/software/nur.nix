{ config, pkgs, ... }:
{
    home-manager.users.chaosattractor = { pkgs, config, lib, ... }: 
    {
        nixpkgs.config.packageOverrides = pkgs: {
            nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
                inherit pkgs;
            };
        };
    };
}