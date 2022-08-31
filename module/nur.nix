{ config, pkgs, ... }:
{
    nixpkgs.config.packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
            inherit pkgs;
        };
    };

    environment.systemPackages = with pkgs; [
        nur.repos.xddxdd.wechat-uos-bin
        nur.repos.linyinfeng.icalingua-plus-plus
    ];
}