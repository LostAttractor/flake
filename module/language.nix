{ config, pkgs, ... }:
{
	i18n.defaultLocale = "zh_CN.UTF-8";

	fonts = {
		fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
			sarasa-gothic  #更纱黑体
      source-code-pro
      source-han-mono
      source-han-sans
      source-han-serif
			jetbrains-mono
      wqy_zenhei
		];

    fontDir.enable = true;
    fontconfig.enable = true;

    #enableDefaultFonts = true;
    #fontconfig.defaultFonts = {
    #  emoji = [ "Noto Color Emoji" ];
    #  monospace = [ "Source Han Mono" ];
    #  sansSerif = [ "Noto Sans CJK SC" ];
    #  serif = [ "Source Han Serif" ];
    #};
	};

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      rime
    ];
  };
}
