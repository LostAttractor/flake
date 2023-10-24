{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    openssl wget axel # Download Tools
    git vim nano # Editor & VCS
    htop micro xsel tmux # Basic Tools
    pciutils usbutils bridge-utils # Utils
    dnsutils ethtool iperf3 mtr # Network Tools
    ipmitool # IPMI
    v2ray # Proxy
    appimage-run # Run Appimage 
    rsync # Rsync
    firefox # Browser
  ];

  programs.sharing.enable = true;
}
