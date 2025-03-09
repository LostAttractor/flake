{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = (with pkgs.vscode-marketplace; [
      jnoortheen.nix-ide
      ms-vscode.makefile-tools
      ms-vscode.cpptools-extension-pack
      ms-vscode.cmake-tools
      twxs.cmake
      golang.go
      ms-vscode.hexeditor
      dakara.transformer
      eamodio.gitlens
      github.vscode-pull-request-github
      github.vscode-github-actions
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-vscode-remote.remote-ssh-edit
      ms-vscode.remote-explorer
      github.copilot
      # Theme
      pkief.material-icon-theme
      zhuangtongfa.material-theme
      # Lang
      ms-ceintl.vscode-language-pack-zh-hans
    ]) ++ (with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      rust-lang.rust-analyzer
      ms-vscode-remote.remote-ssh
      ms-vsliveshare.vsliveshare
    ]);
  };
}
