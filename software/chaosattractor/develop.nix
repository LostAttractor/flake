{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            jetbrains.idea-ultimate
        ];
    };
    imports = [
        ./jetbra.nix
    ];
}