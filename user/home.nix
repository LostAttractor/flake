{ inputs, ... }:
{
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w" # wechat-uos
    "electron-27.3.11"
    "electron-unwrapped-27.3.11"
    "electron-29.4.6"
    "jitsi-meet-1.0.8043"
    "cinny-4.2.3"
    "cinny-unwrapped-4.2.3"
  ];

  nixpkgs.overlays = [ inputs.nur.overlays.default ];

  imports = [
    ./desktop
    ./settings/flatpak.nix
    ./settings/gtk.nix
    ./settings/dconf/blackbox.nix
    ./packages/apps.nix
    ./packages/utils.nix
    ./programs/firefox.nix
    ./programs/shell.nix
    ./programs/vscode.nix
    ./programs/jetbrains.nix
    ./programs/obs-studio.nix
    ./programs/spicetify.nix
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/lazygit.nix
    ./programs/mangohud.nix
    ./programs/java.nix
    ./programs/dotnet.nix
    ./programs/gpg.nix
    ./services/syncthing.nix
    ./services/mpd.nix
    ./services/lorri.nix
  ];

  home.stateVersion = "24.05";
}
