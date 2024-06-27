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
    # Utils
    pciutils
    usbutils
    bridge-utils
    dnsutils
    # Network Tools
    ethtool
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
    # Runtime
    nodejs
    yarn
    python3
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;

  programs.sharing.enable = true;

  # Android debug bridge
  programs.adb.enable = true;
}
