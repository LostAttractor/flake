{ config, pkgs, ... }:
{
    virtualisation.docker = {
		enable = true;
		enableOnBoot = true;
	};
	environment.systemPackages = with pkgs; [
		docker-compose
	];
}