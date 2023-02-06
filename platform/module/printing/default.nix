{ ... }:
{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    # for a WiFi printer
    openFirewall = true;
  };
}
