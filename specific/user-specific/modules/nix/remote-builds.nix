_:

{
  nix.buildMachines = [
    {
      hostName = "nixremote@nixbuilder1.home.lostattractor.net";
      systems = [
        "x86_64-linux"
        "i686-linux"
      ];
      maxJobs = 2;
      speedFactor = 2;
      supportedFeatures = [
        "kvm"
        "nixos-test"
        "ca-derivations"
        "benchmark"
        "big-parallel"
      ];
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nixremote@nixbuilder2.home.lostattractor.net";
      systems = [
        "x86_64-linux"
        "i686-linux"
      ];
      maxJobs = 3;
      speedFactor = 4;
      supportedFeatures = [
        "kvm"
        "nixos-test"
        "ca-derivations"
        "benchmark"
        "big-parallel"
      ];
      mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;
  # Optional, useful when the builder has a faster internet connection than yours
  nix.settings.builders-use-substitutes = true;

  programs.ssh.extraConfig = ''
    Host nixbuilder1.home.lostattractor.net
      IdentityFile /root/.ssh/nixremote
    Host nixbuilder2.home.lostattractor.net
      IdentityFile /root/.ssh/nixremote
  '';
}
