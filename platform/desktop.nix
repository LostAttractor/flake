{ ... }:
{
  services.xserver = {
    enable = true;   # Enable the X11 windowing system.
    layout = "us";   # Configure keymap in X11
    libinput.enable = true;  # Enable touchpad support (enabled default in most desktopManager).
  };
  
  imports = [ 
    ./module/bluetooth
    ./module/printing
    ./module/pipewire
  ];
}
