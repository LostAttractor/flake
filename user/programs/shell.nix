_: {
  programs.fish.enable = true;
  programs.nushell.enable = true;

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  programs.atuin = {
    enable = true;
    flags = [ "--disable-up-arrow" ];
  };
}
