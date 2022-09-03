{ config, pkgs, ... }:
{
	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		openssl wget git vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		htop micro xsel
		axel # Multi-Thread Downloader
	];

	# Set your time zone.
	time.timeZone = "Asia/Shanghai";
	time.hardwareClockInLocalTime = true;
}
