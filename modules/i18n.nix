{ pkgs, ... }:
{
	# i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ rime ];
  };
}
