{ inputs, user, nur, nixpkgs, ... }: 
let
  nur-modules = import inputs.nur {
    nurpkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  };
in {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs user nur-modules; };
  home-manager.users.${user} = import ./user/home.nix;
}