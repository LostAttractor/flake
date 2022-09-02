{ config, pkgs, ... }:
{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chaosattractor = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" "libvirtd" ];  # Enable ‘sudo’ for the user.
        shell = pkgs.fish;
    };

    home-manager.users.chaosattractor = { pkgs, ... }: {
        programs.fish.enable = true;

        home.stateVersion = "22.05";
    };

    imports = [
        ./software/software.nix
    ];
}