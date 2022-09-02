{ config, pkgs, lib, ... }:
{
	services.xserver = {
		enable = true; 	# Enable the X11 windowing system.
		layout = "us";   # Configure keymap in X11
		libinput.enable = true;  # Enable touchpad support (enabled default in most desktopManager).
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

	# boot.resumeDevice = "/dev/disk/by-uuid/1cbac728-10f2-48b4-addf-4ad504313516";

	imports = [ 
		./module/pipewire.nix 
	];
}
