{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            logseq
            obsidian
            wpsoffice-cn
            gimp
        ];
    };

    imports = [
        ./obs-studio/obs-studio.nix
    ];
}