{ config, pkgs, ... }:
{
  nix.settings.auto-optimise-store = true; # 使用硬链接优化store
  
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}