{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      # Noto Fonts
      noto-fonts
      noto-fonts-color-emoji
      # 思源宋体/思源黑体 (CJK Fonts)
      # Variable-fonts may cause some apps to not render CJK correctly
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      # Monospace fonts
      fira-code
      fira-code-symbols
      jetbrains-mono
      # NerdFonts
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "DroidSansMono"
        ];
      })
      # Some unused fonts
      # Cantarell font
      # cantarell-fonts
      # Inter font
      # inter
      # Source fonts
      # source-sans-pro
      # source-serif-pro
      # source-code-pro
      # Source han fonts
      # source-han-sans
      # source-han-serif
      # source-han-mono
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
          "Noto Sans"
          # CJK Fallback
          "Noto Sans SC"
          "Noto Sans TC"
          "Noto Sans JP"
          "Noto Sans KR"
          # Unicode Fallback
          "DejaVu Sans"
        ];
        serif = [
          # Main Serif Font
          "Noto Serif"
          # CJK Fallback
          "Noto Serif SC"
          "Noto Serif TC"
          "Noto Serif JP"
          "Noto Serif KR"
          # Unicode Fallback
          "DejaVu Serif"
        ];
        monospace = [
          # Main Mono Font
          "JetBrainsMono"
          # CJK Fallback
          "Noto Mono SC"
          "Noto Mono TC"
          "Noto Mono JP"
          "Noto Mono KR"
          # Unicode Fallback
          "DejaVu Sans Mono"
        ];
        emoji = [ "Noto Color Emoji" ];
      };

      subpixel.rgba = "rgb";
    };
  };
}
