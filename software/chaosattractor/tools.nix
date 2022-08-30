{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            neofetch
            v2ray
        ];
    };
}