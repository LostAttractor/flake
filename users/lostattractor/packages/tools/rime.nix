{ config, pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub ({
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "8b4b1d417517dcaf809a8d63f1b52ea62247df8f";
    sha256 = "sha256-aA+sg7QtHfcotWGl39Zm7mvm1lBN8nffl9G/NV8EHtQ=";
  });
}