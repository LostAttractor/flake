{ inputs, ... }:
let
  profile = "default";
in
{
  home.file.".mozilla/firefox/${profile}/chrome/firefox-gnome-theme".source =
    inputs.firefox-gnome-theme;

  programs.firefox = {
    enable = true;
    profiles.${profile} = {
      extraConfig = ''
        ${builtins.readFile "${inputs.firefox-gnome-theme}/configuration/user.js"}
      '';

      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";

        #TabsToolbar {
          display: none;
        }

        #sidebar-header {
          display: none;
        }
      '';

      userContent = ''
        @import "firefox-gnome-theme/userContent.css;
      '';
    };
  };
}
