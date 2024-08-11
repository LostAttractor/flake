{ user, ... }:
{
  imports = [ (import ./config.nix { }) ];

  systemd.tmpfiles.rules = [
    # Type Path               Mode UID     GID Age Argument
    "f /dev/shm/looking-glass 0660 ${user} kvm -"
  ];
}
