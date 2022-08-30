{ config, pkgs, ... }:
{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chaosattractor = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];  # Enable ‘sudo’ for the user.
    };
    imports = [
        ../software/chaosattractor/usersoftware.nix
    ];
}