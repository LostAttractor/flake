{ inputs, user, system, ... }: 
let
  nur = import inputs.nur {
    nurpkgs = inputs.nixpkgs.legacyPackages."${system}";
    pkgs = inputs.nixpkgs.legacyPackages."${system}";
  };
in {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs user nur; };
  home-manager.users.${user} = import ./user/home.nix;
}