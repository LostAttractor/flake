{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		clang go deno docker nodejs yarn rustup 
		#rustc cargo
		vscode
	];
}
