{ config, pkgs, lib, ... }:
{
	services.xserver = {
		enable = true; 	# Enable the X11 windowing system.
		layout = "us";   # Configure keymap in X11
		libinput.enable = true;  # Enable touchpad support (enabled default in most desktopManager).
	};
	#sound.enable = true; #Enable sound.
	#hardware.pulseaudio.enable = true;

	# Pipewire
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		#jack.enable = true;
	};

	hardware.bluetooth.enable = true;

	# Enable CUPS to print documents.
	services.printing.enable = true;

	environment.sessionVariables = rec {
		XDG_CACHE_HOME  = "\${HOME}/.cache";
		XDG_CONFIG_HOME = "\${HOME}/.config";
		XDG_BIN_HOME    = "\${HOME}/.local/bin";
		XDG_DATA_HOME   = "\${HOME}/.local/share";

		PATH = [ 
		"\${XDG_BIN_HOME}"
		];
	};

	boot.resumeDevice = "/dev/disk/by-uuid/1cbac728-10f2-48b4-addf-4ad504313516";

	nixpkgs.config.allowUnfree = true;
	imports = [ ../software/default/software.nix ];
}
