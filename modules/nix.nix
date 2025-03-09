{ pkgs, ... }:
{
  nix.package = pkgs.nixVersions.latest;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
      "ca-derivations"
    ];
    trusted-users = [
      "root"
      "@wheel"
    ];
    # Substituters
    substituters = [
      "https://attic.home.lostattractor.net/hydra"
      "https://binarycache.home.lostattractor.net"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
    trusted-public-keys = [
      "hydra:bCXoAKNbKou4hrnzaH2YB0nvbBPj81PmTklSUSQr5I8="
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

  nix.extraOptions = ''
    min-free = ${toString (10 * 1024 * 1024 * 1024)}
    max-free = ${toString (20 * 1024 * 1024 * 1024)}
  '';
}
