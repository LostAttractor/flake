{ osConfig, ... }:
{
  programs.gpg.enable = true;

  # https://wiki.archlinux.org/title/GnuPG
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryPackage = osConfig.programs.gnupg.agent.pinentryPackage;
  };

  # Disable gnome-keyring-ssh
  xdg.configFile."autostart/gnome-keyring-ssh.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Hidden=true
  '';
}
