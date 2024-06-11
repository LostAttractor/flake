_: {
  services.openssh = {
    enable = true;
    settings = {
      # Require public key authentication
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
