{ pkgs, ... }:
{
  home.sessionVariables = {
    DOTNET_ROOT = "${
      (
        with pkgs.dotnetCorePackages;
        combinePackages [
          sdk_6_0
          sdk_7_0
          sdk_8_0
        ]
      )
    }";
  };
}
