{ pkgs, ... }:
{
  xdg.configFile."ibus/rime".recursive = true;
  xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub {
    owner = "LostAttractor";
    repo = "ca-rime-config";
    rev = "6d95e48bcfdb289597fdf91156b8e3b68c841c5c";
    sha256 = "sha256-1H6cSe7jgvXQxfdPqwZCki0DAbNIcwfY2C1y6VXVl7U=";
  };
}