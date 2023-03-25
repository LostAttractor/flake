{ ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" "kms-modifiers" ];
    };
  };

  # home.sessionVariables.NIXOS_OZONE_WL = "1";
}