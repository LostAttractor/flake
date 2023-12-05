_:
{
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # https://github.com/NixOS/nixpkgs/issues/258048
  nixpkgs.config.permittedInsecurePackages = [ "electron-22.3.27" ];

  imports = [
    ./desktop
    ./settings/shell
    ./settings/i18n
    ./settings/fonts
    ./settings/firefox
    ./settings/flatpak
    ./settings/hidpi
    ./packages/apps
    ./packages/tools
    ./packages/work
    ./packages/develop
    ./packages/gaming
    ./packages/media
  ];

  home.stateVersion = "23.05";
}
