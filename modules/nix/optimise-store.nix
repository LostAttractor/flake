_:
{
  # Optimize nix store by using hard-link
  nix.settings.auto-optimise-store = true; 
  
  # Automatic GC
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}