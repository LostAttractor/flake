{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            obs-studio
        ];
    };
}