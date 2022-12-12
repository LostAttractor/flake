{ config, pkgs, ... }:
{
  hardware.firmware = [
    (
      pkgs.runCommandNoCC "edid" { } ''
        mkdir -p $out/lib/firmware/edid
        cp ${./edid.bin} $out/lib/firmware/edid/edid.bin
      ''
    )
  ];
  boot.kernelParams = [ "drm.edid_firmware=edid/edid.bin" ];
}
