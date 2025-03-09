_:
{
  programs.home-manager.enable = true;


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
