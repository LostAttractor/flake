{ pkgs, ... }:
{
  fonts = {
	  fonts = with pkgs; [
      # noto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      # source
      source-code-pro
      source-sans
      source-sans-pro
      source-serif
      source-serif-pro
      source-han-code-jp
      source-han-sans
      source-han-serif
      source-han-mono
      # jetbrains
	    jetbrains-mono
      # fira
      fira-code
      fira-code-symbols
      # wqy
      wqy_zenhei
      #更纱黑体
      sarasa-gothic
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
	  ];
    fontDir.enable = true;
    fontconfig.enable = true;

    # enableDefaultFonts = true;
    # fontconfig.defaultFonts = {
    #   emoji = [ "Noto Color Emoji" ];
    #   monospace = [ "Source Han Mono" ];
    #   sansSerif = [ "Noto Sans CJK SC" ];
    #   serif = [ "Source Han Serif" ];
    # };
  };
}
