{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		clang go deno docker
		vscode
	];
}
