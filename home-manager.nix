{
  inputs,
  user,
  system,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs user system;
  };
  home-manager.users.${user} = import ./user/home.nix;
}
