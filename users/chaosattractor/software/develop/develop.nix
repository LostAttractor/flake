{ config, pkgs, ... }:
{
    home-manager.users.chaosattractor = { pkgs, ... }: 
    {     
        home.packages = with pkgs; [
            github-desktop
            jetbrains.idea-ultimate
            jetbrains.clion
            hugo
        ];
    };

    imports = [
        ./vscode/vscode.nix
    ];
}