{ config, pkgs, ... }:
{
  hardware.firmware = [
    (
      pkgs.runCommandNoCC "r9000p-edid" { } ''
        mkdir -p $out/lib/firmware/edid
        cp ${./2560x1600.bin} $out/lib/firmware/edid/2560x1600.bin
      ''
    )
  ];
  boot.kernelParams = [ "drm.edid_firmware=eDP-1:edid/2560x1600.bin" ];
}
