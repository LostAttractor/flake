{ config, pkgs, ... }:
{
    home-manager.users.chaosattractor = { pkgs, ... }: 
    {
        home.packages = with pkgs; [
            logseq
            obsidian
            wpsoffice-cn
        ];
    };

    imports = [
        ./mediaediting/mediaediting.nix
        ./kuro/kuro.nix
    ];
}