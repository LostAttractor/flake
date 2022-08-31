{ config, pkgs, ... }:
{
    users.users.chaosattractor = {
        packages = with pkgs; [
            firefox-wayland #firefox
            chromium
            microsoft-edge
            tdesktop
            keeweb
            nur.repos.xddxdd.wechat-uos-bin
            nur.repos.linyinfeng.icalingua-plus-plus
        ];
    };
    environment.sessionVariables = {
        MOZ_DISABLE_RDD_SANDBOX = "1";
    };
}