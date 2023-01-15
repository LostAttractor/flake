{ pkgs, ... }:
let
  fromYAML = yaml:
  builtins.fromJSON (builtins.readFile (pkgs.stdenv.mkDerivation {
    name = "fromYAML";
    phases = [ "buildPhase" ];
    buildPhase = "${pkgs.yaml2json}/bin/yaml2json < ${builtins.toFile "yaml" yaml} > $out";
  }));
  alacritty-theme = pkgs.fetchFromGitHub {
    owner = "eendroroy";
    repo = "alacritty-theme";
    rev = "0760a0c6129c7a51d2eb9995639b8bc6e1a3c793";
    hash = "sha256-CWRAYDG5wAGwt6v8CljxREyHAQQ+vh1M8IiyoMm7yYE=";
  };
  getTheme = themeName :
    fromYAML (builtins.readFile "${alacritty-theme}/themes/${themeName}.yaml");
in {
  programs.alacritty = { #env WAYLAND_DISPLAY=\x1d alacritty
    enable = true;
    settings =
      let
        theme = getTheme "afterglow"; #设置主题
      in theme // {
        font = let font = "Hack Nerd Font Mono"; in {
          normal    = { family = font; style = "Regular"; };
          bold    = { family = font; style = "Bold"; };
          italic    = { family = font; style = "Italic"; };
          bold_italic = { family = font; style = "Bold Italic"; };
        };
        live_config_reload = true;
        tabspaces = 4;
        window = {
          dimensions = {
            columns = 90;
            lines = 33;
          };
          position = {
            x = 500;
            y = 500;
          };
          startup_mode = "Windowed";
          padding = {
            x = 8;
            y = 12;
          };
          dynamic_padding = true;
          dynamic_title = true;
          decorations = "none";
          decorations_theme_variant = "dark";
          opacity = 0.9;
        };
        scrolling = {
          # 历史保留行数
          history = 10000;
          # 每次滚动行数
          multiplier = 10;
          # 每次滚动行数（分屏时）
          faux_multiplier = 100;
          # 自动滚动至最新行
          auto_scroll = true;
        };
        key_bindings = [
          { 
            key = "C";
            mods = "command"; 
            action = "Copy"; 
          }
          { 
            key = "V";
            mods = "command"; 
            action = "Paste"; 
          }
        ];
      };
  };
}