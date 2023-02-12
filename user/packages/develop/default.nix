{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools
    gh
    # IDE
    # vscode
    lapce
    github-desktop
    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.pycharm-professional
    # Tools-Chain
    hugo
    openjdk8
    # zulu8
    # conda
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);
  };

  imports = [
    ./jetbra
  ];
}