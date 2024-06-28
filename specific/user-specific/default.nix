{ ... }:
{
  imports = [
    ./modules/sudo.nix
    ./modules/nix/access-tokens.nix
    ./modules/nix/remote-builds.nix
    ./modules/network/firewall.nix
    ./modules/network/proxy.nix
    ./modules/network/tailscale.nix
    ./modules/features/ollama.nix
    ./modules/features/waydroid.nix
    ./modules/features/looking-glass/kvmfr.nix
  ];
}
