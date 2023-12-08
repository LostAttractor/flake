{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      jnoortheen.nix-ide
      ms-python.python
      ms-vscode.cpptools
      ms-vscode-remote.remote-ssh
      rust-lang.rust-analyzer
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace (import ./extensions.nix).extensions;
  };
}