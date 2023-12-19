_:

{
  nix.buildMachines = [
    {
      hostName = "nixbuilder1.home.lostattractor.net";
      systems = ["x86_64-linux" "i686-linux"];
      maxJobs = 1;
      speedFactor = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nixbuilder2.home.lostattractor.net";
      systems = ["x86_64-linux" "i686-linux"];
      maxJobs = 3;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      speedFactor = 4;
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nixbuilder.home.net.men.ci";
      systems = ["x86_64-linux" "i686-linux"];
      maxJobs = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      speedFactor = 1;
      mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;
  # optional, useful when the builder has a faster internet connection than yours
  nix.settings.builders-use-substitutes = true;

  programs.ssh.extraConfig = ''
    Host nixbuilder1.home.lostattractor.net
      IdentityFile /root/.ssh/nixremote
      User nixremote
    Host nixbuilder2.home.lostattractor.net
      IdentityFile /root/.ssh/nixremote
      User nixremote
    Host nixbuilder.home.net.men.ci
      IdentityFile /root/.ssh/nixremote
      User nixremote
  '';
}