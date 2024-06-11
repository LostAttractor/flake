_: {
  # Substituters
  nix.settings = {
    substituters = [
      "https://binarycache.home.lostattractor.net"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
    trusted-public-keys = [
      "binarycache.home.lostattractor.net:nB258qoytYrdCe2pcI6qJ/M9R0l7Q5l9Bu5ryCbzItc="
    ];
  };

  # Optimize nix store by using hard-link
  nix.settings.auto-optimise-store = true;

  # Automatic GC
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
