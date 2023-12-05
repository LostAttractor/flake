{ pkgs, ... }:
{ 
  home.packages = with pkgs; [
    osu-lazer-bin
    lunar-client
    protonup-ng
    lutris
    yuzu-early-access
  ];

  programs.mangohud.enable = true;

  # MANGOHUD=1 gamemoderun DXVK_ASYNC=1 %command% -novid -high +fps_max 144
  # gamemoderun DXVK_ASYNC=1 %command%

  # Force vulkan loader: 
  # environment.variables.VK_ICD_FILENAMES =
  # "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
  # export VK_ICD_FILENAMES="/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json"
  # https://nixos.org/manual/nixos/unstable/index.html#sec-gpu-accel-vulkan
}