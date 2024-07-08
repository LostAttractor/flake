_:
let
  systems = [
    "x86_64-linux"
    "i686-linux"
    "aarch64-linux"
  ];
  supportedFeatures = [
    "nixos-test"
    "benchmark"
    "big-parallel"
    "kvm"
    "nix-command"
    "flakes"
    "ca-derivations"
  ];
in
{
  nix.buildMachines = [
    {
      hostName = "nixremote@hydra.home.lostattractor.net";
      # protocol = "ssh-ng";
      systems = systems;
      maxJobs = 6;
      speedFactor = 4;
      supportedFeatures = supportedFeatures;
      mandatoryFeatures = [ ];
      publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSU9iWjBoTjEwbjBYSUtvS1dEdjg1ZElkVlZPbjNPMlozSUhRdkgxK051Tlogcm9vdEBIeWRyYQo=";
    }
    {
      hostName = "nixremote@nixbuilder1.home.lostattractor.net";
      # protocol = "ssh-ng";
      systems = systems;
      maxJobs = 2;
      speedFactor = 2;
      supportedFeatures = supportedFeatures;
      mandatoryFeatures = [ ];
      publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUU0Wk8rSitaWnRSazl1QUFTQVVkbGF5d0h2NVhhRHU5SytOT2g1c1Raa3Agcm9vdEBuaXhvcwo=";
    }
  ];
  nix.distributedBuilds = true;
  # Optional, useful when the builder has a faster internet connection than yours
  nix.settings.builders-use-substitutes = true;

  programs.ssh.extraConfig = ''
    Host nixbuilder1.home.lostattractor.net
      IdentityFile /root/.ssh/nixremote
    Host hydra.home.lostattractor.net
      IdentityFile /root/.ssh/nixremote
  '';
}
