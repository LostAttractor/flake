{ pkgs, ... }:
{
  fonts = {
	  packages = with pkgs; [
      # Inter
      inter
      # Noto Fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      # Source Fonts
      source-sans-pro
      source-serif-pro
      source-code-pro
      # 思源宋体/思源黑体 (Non Variable CJK Fonts)
      source-han-sans
      source-han-serif
      source-han-mono
      # 文泉驿
      wqy_microhei
      wqy_zenhei
      # 更纱黑体
      sarasa-gothic
      # Monospace
      fira-code
      fira-code-symbols
      jetbrains-mono
      hack-font
      # NerdFonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "DroidSansMono" ]; })
	  ];
    fontconfig = {
      defaultFonts = {
        serif = [ 
          "Noto Serif" # Main Serif Font
          "Noto Serif CJK SC" # CJK Fallback
          "Source Han Serif SC" #  CJK Non-VF Fallback
          "DejaVu Serif" # Unicode Fallback
        ];
        sansSerif = [ 
          "Inter" # Main Sans-Serif Font
          "Noto Sans CJK SC" # CJK Fallback
          "Source Han Sans SC" #  CJK Non-VF Fallback
          "DejaVu Sans" # Unicode Fallback
        ];
        monospace = [ 
          "JetBrainsMono" # Main Mono Font
          # "Noto Sans Mono CJK SC" # CJK Fallback
          "Source Han Mono SC" # CJK Non-VF Fallback
          "DejaVu Sans Mono" # Unicode Fallback
        ];
        emoji = [ "Noto Color Emoji" ];
      };

      subpixel.rgba = "rgb";
    };

    fontDir.enable = true;
  };
}
