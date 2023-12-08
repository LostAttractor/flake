{ pkgs, ... }:
{
  home.packages = with pkgs; [
    openjdk8
    adoptopenjdk-icedtea-web
  ];
}