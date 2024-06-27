{ pkgs, ... }:
{
  # BUG: 如果不设置 LANG=zh_CN.utf8 可能导致ibus中文输入异常
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ rime ];
  };
}
