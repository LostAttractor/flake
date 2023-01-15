{ ... }:
{
  services.xserver = {
    enable = true;   # Enable the X11 windowing system.
    layout = "us";   # Configure keymap in X11
    libinput.enable = true;  # Enable touchpad support (enabled default in most desktopManager).
  };

  hardware.bluetooth.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish.enable = true;
    publish.addresses = true;
    publish.workstation = true;
    publish.userServices = true;
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  imports = [ 
    ./module/pipewire
  ];
}
