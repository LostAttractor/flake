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

	# 简单配置一下 fontconfig 字体顺序，以免 fallback 到不想要的字体
	#fonts.fontconfig = {
	#	defaultFonts = {
	#		emoji = ["Noto Color Emoji"];
	#		monospace = [
	#			"Noto Sans Mono CJK SC"
   #     "DejaVu Sans Mono"
   #   ];
   #   sansSerif = [
   #     "Noto Sans CJK SC"
   #     "Source Han Sans SC"
   #   ];
   #   serif = [
   #     "Noto Serif CJK SC"
   #     "Source Han Serif SC"
   #   ];
  #  };
  #};

  i18n.inputMethod = {
    # enabled = "fcitx5";
    # fcitx5.enableRimeData= true;
    # fcitx5.addons = with pkgs; [
    #   fcitx5-rime
    #   fcitx5-chinese-addons
    # ];
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
      rime
    ];
  };
}
