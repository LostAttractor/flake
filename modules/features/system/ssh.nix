_:
{
  services.openssh = {
    enable = true;
    settings = {
      # require public key authentication for better security
      passwordAuthentication = false;
      kbdInteractiveAuthentication = false;
      #permitRootLogin = "yes";
    };
  };
}
