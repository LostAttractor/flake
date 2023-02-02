{ pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub {
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "3485e477f0217c5ff1daacfe993ac929883f3545";
    sha256 = "sha256-8AmQW2/TfTl8CULMxA25/IADDd8iGdxv5WeRr2cNnHQ=";
  };
}