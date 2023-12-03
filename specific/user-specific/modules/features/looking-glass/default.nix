{ user, ... }:
let
  looking-glass-client-config = ''
    [win]
    fullScreen=yes

    [input]
    escapeKey=97

    [spice]
    captureOnStart=yes
  '';
in
{
  systemd.tmpfiles.rules = [ 
    # Type Path               Mode UID     GID Age Argument
    "f /dev/shm/looking-glass 0660 ${user} kvm -"
  ];

  environment.etc."looking-glass-client.ini".text = looking-glass-client-config;
}