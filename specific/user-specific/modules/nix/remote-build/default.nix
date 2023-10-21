_:

{
  nix.buildMachines = [
    {
      hostName = "root@nixbuilder.home.lostattractor.net";
      systems = ["x86_64-linux" "i686-linux"];
      maxJobs = 8;
      speedFactor = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      mandatoryFeatures = [ ];
    }
        {
      hostName = "root@nixbuilder2.home.lostattractor.net";
      systems = ["x86_64-linux" "i686-linux"];
      maxJobs = 8;
      speedFactor = 2;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      mandatoryFeatures = [ ];
    }
    {
      hostName = "nix@nixbuild.home.net.men.ci";
      systems = ["x86_64-linux" "i686-linux"];
      maxJobs = 8;
      speedFactor = 1;
      supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
      mandatoryFeatures = [ ];
    }
  ];
  nix.distributedBuilds = true;
  # optional, useful when the builder has a faster internet connection than yours
  nix.extraOptions = ''
  	builders-use-substitutes = true
  '';
}