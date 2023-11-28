_:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # Enable IPP Everywhere protocol for autodiscovery
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
}
