_:

{
  boot.extraModprobeConfig = ''
    options usbhid mousepoll=1
    options usbhid kbpoll=1
    options usbhid jspoll=1
    options xpad cpoll=1
  '';
}