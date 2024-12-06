{ pkgs, ... }:
let
  dotnet-sdks = with pkgs.dotnetCorePackages; combinePackages [ sdk_8_0 sdk_9_0 ];
in
{
  # https://nixos.wiki/wiki/DotNET
  home.sessionVariables.DOTNET_ROOT = "${dotnet-sdks}/share/dotnet";
  home.packages = [ dotnet-sdks ];
}
