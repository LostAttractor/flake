_: {
  specialisation."NvidiaSync".configuration = {
    system.nixos.tags = [ "Nvidia-Sync-Mode" ];

    hardware.nvidia.prime = {
      offload.enable = false;
      sync.enable = true;
    };
  };

  specialisation."NvidiaReverseSync".configuration = {
    system.nixos.tags = [ "Nvidia-Reverse-Sync-Mode" ];

    hardware.nvidia.prime = {
      reverseSync.enable = true;

      # Enable if using an external GPU
      allowExternalGpu = false;
    };
  };
}
