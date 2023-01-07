{ config, pkgs, ... }:
let
  kuro-package = pkgs.fetchFromGitHub {
    owner = "LostAttractor";
    repo = "kuro";
    rev = "593a2c72b074c6c22a1f460fdc91aa314a91bbe3";
    sha256 = "15y27g9h0dmwilazj02l36yz4r722yn7wv6xd2l9zq39nxkgpmd8";
  };
in {
  home.packages = with pkgs; [
    (pkgs.callPackage "${kuro-package}" { })
  ];
}