{ config, pkgs, ... }:
{
  fonts = {
	  fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      # source-code-pro
      source-han-mono
      source-han-sans
      source-han-serif
	    jetbrains-mono
      hack-font
      fira-code
      fira-code-symbols
      wqy_zenhei
      sarasa-gothic  #更纱黑体
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" "Hack" ]; })
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
}
