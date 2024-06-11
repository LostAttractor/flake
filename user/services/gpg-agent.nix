_: {
  # https://wiki.archlinux.org/title/GnuPG
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  # Disable gnome-keyring-ssh
  xdg.configFile."autostart/gnome-keyring-ssh.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Hidden=true
  '';
}
