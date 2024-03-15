{ pkgs, ... }:
{
  home.packages = with pkgs; [
    openjdk8
    # Deprecated
    # adoptopenjdk-icedtea-web
  ];
}