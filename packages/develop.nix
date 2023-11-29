{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    clang go rustup gcc # Compiler
    nodejs yarn # NodeJS
    python3 # Python
  ];

  # Android debug bridge
  programs.adb.enable = true;
}