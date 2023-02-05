{ pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Basic Tools
    openssl wget axel # Downloader
    git vim nano # Develop
    htop micro xsel
    pciutils usbutils bridge-utils # Utils
    rsync
  ];

  programs.sharing.enable = true;
}
