{ config, pkgs, ... }:
{
    programs.fish.enable = true;
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chaosattractor = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];  # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
    };
    imports = [
        ../software/chaosattractor/usersoftware.nix
    ];
}