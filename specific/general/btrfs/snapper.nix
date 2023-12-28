_:
{
  services.snapper = {
    cleanupInterval = "7d";
    configs."home" = {
      SUBVOLUME = "/home";
      ALLOW_GROUPS = [ "wheel" ];
      TIMELINE_CREATE = true;
      TIMELINE_CLEANUP = true;
    };
  };
}