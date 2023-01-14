{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    openssl wget git vim
    htop micro xsel
    axel # Multi-Thread Downloader
  ];

  programs.sharing.enable = true;
}
