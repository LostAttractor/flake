_: {
  programs.lazygit = {
    enable = true;
    settings.git.paging.externalDiffCommand = "difft";
  };
}
