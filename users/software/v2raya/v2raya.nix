{ config, pkgs, ... }:
{
    environment.systemPackages = [
        (pkgs.callPackage ./v2raya { })
    ];

    imports = [
        ./services.nix
    ];

    services.v2raya.enable = true;
}
