{ pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub {
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "62fdb53d89618b17b48dce28bd2f05b3f9fac8d1";
    sha256 = "sha256-pMcUPw1tHp3fYDH3Mb93Va2uCovzoQzmxQU8Q+5fqV0=";
  };
}