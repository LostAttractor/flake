{ inputs, system, ...}:
{
  age.secrets.nix-access-tokens = {
    file = ./keys/nix-access-tokens.age;
    group = "wheel";
    mode = "0440";
  };

  age.secrets.rathole.file = ./keys/rathole.age;

  environment.systemPackages = [ inputs.agenix.packages.${system}.default ];
}