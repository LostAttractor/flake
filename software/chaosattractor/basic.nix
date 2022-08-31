{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            firefox-wayland #firefox
            chromium
            microsoft-edge
            tdesktop
            keeweb
        ];
    };
    environment.sessionVariables = {
        MOZ_DISABLE_RDD_SANDBOX = "1";
    };
}