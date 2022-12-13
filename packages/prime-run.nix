{ config, pkgs, ... }:
let
  prime-run = pkgs.writeShellScriptBin "prime-run" ''
    __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
  '';
in
{
  environment.systemPackages = [ prime-run ];
}