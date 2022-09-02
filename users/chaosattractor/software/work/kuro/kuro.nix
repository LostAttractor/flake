{ config, pkgs, ... }:
{
    home-manager.users.chaosattractor = { pkgs, ... }: 
    {        
        home.packages = with pkgs; [
            (pkgs.callPackage ./pkg.nix { })
        ];
    };
}