{ user, ... }:
{
  home-manager.users.${user} = import ../../../user/desktop/hyprland;
}
