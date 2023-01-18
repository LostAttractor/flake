{ pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub {
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "09438011fdeea8ab9689f49e22f501d0103acc83";
    sha256 = "sha256-5pwAmv7wpRoe1FSweqUUlL843LUA2Dq99wjTl5KvLVY=";
  };
}