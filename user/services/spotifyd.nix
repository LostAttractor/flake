{ pkgs, ... }:
{
  services.spotifyd = {
    enable = true;
    package = pkgs.spotifyd.override { withKeyring = true; };
    settings =
      {
        global = {
          # https://docs.spotifyd.rs/config/File.html
          # secret-tool store --label='Spotify' application rust-keyring service spotifyd username lostattractor@gmail.com
          username = "lostattractor@gmail.com";
          use_keyring = true;
          bitrate = 320;
        };
      }
    ;
  };
}