{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Download Tools
    wget
    axel
    curlHTTP3
    # Editor & VCS
    git
    vim
    nano
    # Basic Tools
    htop
    tmux
    # Devices
    pciutils
    usbutils
    smartmontools
    # Network
    inetutils
    bridge-utils
    dnsutils
    ethtool
    trippy
    q
    dogdns
    # Graphics
    vulkan-tools
    mesa-demos
    # Video Codec
    libva-utils
    # Sensors
    lm_sensors
    # Rsync
    rsync
    # Compiler
    clang
    go
    rustup
    gcc
    gdb
    # Runtime
    nodejs
    yarn
    python3
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.iotop.enable = true;
  programs.iftop.enable = true;
  programs.bandwhich.enable = true;
  programs.mtr.enable = true;
  programs.nexttrace.enable = true;
  programs.trippy.enable = true;
  programs.wireshark.enable = true;

  programs.sharing.enable = true;

  # Android debug bridge
  programs.adb.enable = true;
}
