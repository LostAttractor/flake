{ lib , ... }:
{ 
  hardware.asahi.useExperimentalGPUDriver = true;
  # hardware.asahi.experimentalGPUInstallMode = "overlay";

  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  #hardware.asahi.extractPeripheralFirmware = false;

  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;
}
