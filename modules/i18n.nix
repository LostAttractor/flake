{ pkgs, ... }:
{
	# i18n.defaultLocale = "zh_CN.UTF-8";

  # console = {
  #   font = "Lat2-Terminus16";
  #   # keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ rime ];
  };
}
