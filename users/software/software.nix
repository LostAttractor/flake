{ config, pkgs, ... }:
{
    imports = [
        ./steam.nix
        ./v2raya/v2raya.nix
        #./vscode/vscode.nix
    ];
}
