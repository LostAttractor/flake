{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    axel
    curlHTTP3 # Download Tools
    git
    vim
    micro
    nano # Editor & VCS
    htop
    tmux # Basic Tools
    pciutils
    usbutils
    bridge-utils # Utils
    dnsutils
    ethtool
    iperf3 # Network Tools
    ipmitool # IPMI
    v2ray
    xray
    sing-box # Proxy
    appimage-run # Run Appimage
    rsync # Rsync
    clang
    go
    rustup
    gcc # Compiler
    nodejs
    yarn # NodeJS
    python3 # Python
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;

  programs.sharing.enable = true;

  # Android debug bridge
  programs.adb.enable = true;
}
