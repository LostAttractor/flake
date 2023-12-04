_:
{
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };

  services.gnome.gnome-keyring.enable = true;
}