{ config, pkgs, ... }:
{
    home-manager.users.chaosattractor = { pkgs, ... }: 
    {        
        home.packages = with pkgs; [
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