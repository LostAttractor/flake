{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            neofetch
            screenfetch
            cmatrix
            v2ray
        ];
    };
}