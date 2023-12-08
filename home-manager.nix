{ inputs, user, system, ... }: 
{
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs user system; };
  home-manager.users.${user} = import ./user/home.nix;
}