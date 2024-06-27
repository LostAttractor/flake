{ inputs, ... }:
{
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w" # wechat-uos
  ];

  nixpkgs.overlays = [ inputs.nur.overlay ];

  imports = [
    ./desktop
    ./settings/shell.nix
    ./settings/gtk.nix
    ./settings/dconf/blackbox.nix
    ./packages/apps.nix
    ./packages/utils.nix
    ./programs/firefox.nix
    ./programs/vscode
    ./programs/jetbrains.nix
    ./programs/obs-studio.nix
    ./programs/spicetify.nix
    ./programs/kitty.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
    ./programs/mangohud.nix
    ./programs/java.nix
    ./services/gpg-agent.nix
    ./services/mpd.nix
    ./services/lorri.nix
  ];

  home.stateVersion = "24.05";
}
