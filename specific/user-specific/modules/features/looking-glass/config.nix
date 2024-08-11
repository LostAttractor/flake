{
  additional ? "",
  ...
}:
let
  config = ''
    [win]
    fullScreen=yes

    [input]
    escapeKey=97

    [spice]
    captureOnStart=yes
  '';
in
{
  environment.etc."looking-glass-client.ini".text = config + additional;
}
