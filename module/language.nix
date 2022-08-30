{ config, pkgs, ... }:
{
	i18n.defaultLocale = "zh_CN.UTF-8";

	fonts = {
		fontDir.enable = true;
		fonts = with pkgs; [
			noto-fonts
			noto-fonts-cjk
      noto-fonts-cjk-sans
			noto-fonts-cjk-serif
      noto-fonts-emoji
			sarasa-gothic  #更纱黑体
			source-code-pro
			hack-font
			jetbrains-mono
		];
	};

	# 简单配置一下 fontconfig 字体顺序，以免 fallback 到不想要的字体
	fonts.fontconfig = {
		defaultFonts = {
			emoji = ["Noto Color Emoji"];
			monospace = [
				"Noto Sans Mono CJK SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
        ];
      };
    };

  i18n.inputMethod = {
    # enabled = "fcitx5";
    # fcitx5.enableRimeData= true;
    # fcitx5.addons = with pkgs; [
    #   fcitx5-rime
    #   fcitx5-chinese-addons
    # ];

    # 我现在用 ibus
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      rime
    ];
  };
}
