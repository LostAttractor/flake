{ config, pkgs, ... }:
{
    xdg.configFile."ibus/rime".recursive = true;
    xdg.configFile."ibus/rime".source = pkgs.fetchFromGitHub ({
        owner = "LostAttractor";
        repo = "ca-rime-config";
        rev = "6e9f039d4858db44b88ad48220e57b38d2ca1ae7";
        sha256 = "00rhip8h3i988nby8nc7w4yp6ygfybv4v5hmwx4j888xmd4lwsbh";
    });
}