{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            (pkgs.callPackage ./pkg.nix { })
        ];
    };
}