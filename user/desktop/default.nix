_:
{
  # Enable Wayland for Chromium (CEF) Apps
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  
  imports = [
    ./gnome
  ];
}
