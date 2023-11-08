{ pkgs, ... }:
{
	# i18n.defaultLocale = "zh_CN.UTF-8";

  # BUG: 如果不设置 LANG=zh_CN.utf8 可能导致ibus中文输入异常

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
    ];
  };
}
