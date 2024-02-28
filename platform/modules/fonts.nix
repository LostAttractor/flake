{ pkgs, ... }:
{
  fonts = {
	  packages = with pkgs; [
      # Cantarell
      cantarell-fonts
      # Noto Fonts
      noto-fonts
      noto-fonts-color-emoji
      # 思源宋体/思源黑体 (CJK Fonts)
      # Variable-fonts may cause some apps to not render CJK correctly
      # noto-fonts-cjk-sans
      # noto-fonts-cjk-serif
      # So currectly using non-variable version
      source-han-sans
      source-han-serif
      source-han-mono
      # Monospace fonts
      fira-code
      fira-code-symbols
      jetbrains-mono
      # NerdFonts
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "DroidSansMono" ]; })
      # Some unused fonts
      # Inter font
      # inter
      # Source fonts
      # source-sans-pro
      # source-serif-pro
      # source-code-pro
      # 文泉驿
      # wqy_microhei
      # wqy_zenhei
      # 更纱黑体
      # sarasa-gothic
      # hack fonts (monospace)
      # hack-font
	  ];
    fontconfig = {
      defaultFonts = {
        sansSerif = [
          # Main Sans-Serif Font 
          "Cantarell"
          # CJK Non-VF Fallback
          "Source Han Sans SC"
          "Source Han Sans TC"
          "Source Han Sans JP"
          "Source Han Sans KR"
          # Unicode Fallback
          "DejaVu Sans"
        ];
        serif = [ 
          # Main Serif Font
          "Noto Serif"
          # CJK Non-VF Fallback
          "Source Han Serif SC"
          "Source Han Serif TC"
          "Source Han Serif JP"
          "Source Han Serif KR"
          # Unicode Fallback
          "DejaVu Serif"
        ];
        monospace = [
          # Main Mono Font
          "JetBrainsMono"
          # CJK Non-VF Fallback
          "Source Han Mono SC"
          "Source Han Mono TC"
          "Source Han Mono JP"
          "Source Han Mono KR"
          # Unicode Fallback
          "DejaVu Sans Mono"
        ];
        emoji = [ "Noto Color Emoji" ];
      };

      subpixel.rgba = "rgb";
    };
  };
}
