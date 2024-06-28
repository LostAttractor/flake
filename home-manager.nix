{
  inputs,
  user,
  system,
  config,
  ...
}:
{
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs user system;
    pinentry = config.programs.gnupg.agent.pinentryPackage;
  };
  home-manager.users.${user} = import ./user/home.nix;
}
