{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            github-desktop
            jetbrains.idea-ultimate
            jetbrains.clion
        ];
    };
}
