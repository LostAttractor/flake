{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            osu-lazer
        ];
    };
    imports = [
        ./steam.nix
    ];
}