_:
{
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      add_newline = true;

      character = {
        success_symbol = "[➜](bold green)";
      };
    
      package = {
        disabled = true;
      };
    };
  };
}