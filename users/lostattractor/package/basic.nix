{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        firefox-wayland #firefox
        chromium
        # microsoft-edge
        tdesktop
        signal-desktop
        keeweb
    ];
    
    home.sessionVariables = {
        MOZ_DISABLE_RDD_SANDBOX = "1";
    };
}