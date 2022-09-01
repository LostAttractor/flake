{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            aegisub
            handbrake
            audacity
            gimp
        ];
    };

    imports = [
        ./obs-studio/obs-studio.nix
        ./kdenlive/kdenlive.nix
    ];
}