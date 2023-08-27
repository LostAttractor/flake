{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    openssl wget axel # Downloader
    git vim nano # Develop
    htop micro xsel # Basic Tools
    pciutils usbutils bridge-utils dnsutils ethtool iperf3 mtr ipmitool # Utils / Tools
    v2ray # Proxy
    appimage-run # Run Appimage 
    rsync # Rsync
    firefox # Browser
  ];

  programs.sharing.enable = true;
}
