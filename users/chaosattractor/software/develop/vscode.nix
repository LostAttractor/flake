{ config, pkgs, ... }:
{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhs;
        #package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib ]);
    };
}