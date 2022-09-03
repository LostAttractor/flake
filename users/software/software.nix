{ config, pkgs, ... }:
{
    imports = [
        ./steam.nix
        ./vscode/vscode.nix
    ];
}
