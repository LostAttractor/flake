{ config, pkgs, ... }:
{
  hardware.firmware = [
    (
      pkgs.runCommandNoCC "r9000p-edid" { } ''
        mkdir -p $out/lib/firmware/edid
        cp ${./r9000p-edid.bin} $out/lib/firmware/edid/r9000p-edid.bin
      ''
    )
  ];
  boot.kernelParams = [ "drm.edid_firmware=eDP-1:edid/r9000p-edid.bin" ];
}
