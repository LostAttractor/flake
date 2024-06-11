_: {
  # Enable Wayland for Chromium (CEF) Apps
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  # Using vulkan renderer for gtk4
  home.sessionVariables.GSK_RENDERER = "vulkan";
}
