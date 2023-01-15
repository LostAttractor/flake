{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang go rustup
  ];
}
