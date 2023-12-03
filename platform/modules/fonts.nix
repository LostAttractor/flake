{ pkgs, config, ... }:
{
  fonts = {
	  packages = with pkgs; [
      # Inter
      inter
      # Noto Fonts
      noto-fonts
      # noto-fonts-cjk-sans
      # noto-fonts-cjk-serif
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

    fontDir.enable = true;
  };
}
