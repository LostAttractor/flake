{ config, pkgs, ... }:
{
    home-manager.users.chaosattractor = { pkgs, ... }: 
    {   
        home.packages = with pkgs; [
            # osu-lazer #体验很差
        ];
    };
    imports = [
        ./steam.nix
    ];
}