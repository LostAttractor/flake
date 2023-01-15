{ pkgs, ... }:
{ 
  home.packages = with pkgs; [
    osu-lazer-bin
    # lunar-client
    protonup-ng
    lutris
  ];

  programs.mangohud.enable = true;
  programs.mangohud.enableSessionWide = true;

  systemd.user.sessionVariables = {
    MANGOHUD = 1;
    MANGOHUD_DLSYM = 1;
  };

  # MANGOHUD=1 gamemoderun DXVK_ASYNC=1 %command% -novid -high +fps_max 144
  # gamemoderun DXVK_ASYNC=1 %command%
}