_:
{
  nix.settings.access-tokens = [ "github.com=${builtins.readFile ./token_github_api}" ];
}
