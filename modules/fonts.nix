{ pkgs, ... }:
{
  fonts = {
	  packages = with pkgs; [
      # Noto Fonts (Variable Fonts)
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
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
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
	  ];
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "FiraCode" ];
        sansSerif = [
          "Noto Sans"
          "Source Han Sans SC" # This is a non-VF font, used to solve the problem of incorrect font weight in Qt applications (such as Tdesktop)
          "Source Han Sans TC"
          "Source Han Sans JP"
          "Source Han Sans KR"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif"
          "Source Han Serif SC"
          "Source Han Serif TC"
          "Source Han Serif JR"
          "Source Han Serif KR"
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
          "DejaVu Serif"
        ];
      };

      subpixel.rgba = "rgb";
    };

    fontDir.enable = true;
  };
}
