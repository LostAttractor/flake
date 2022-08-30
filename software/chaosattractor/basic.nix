{ config, pkgs, ... }:
{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chaosattractor = {
        packages = with pkgs; [
            firefox-wayland #firefox
            chromium
            tdesktop
            keeweb
        ];
    };
    environment.sessionVariables = {
        MOZ_DISABLE_RDD_SANDBOX = "1";
    };
}