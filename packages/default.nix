{ ... }:
{
  imports = [ 
	  ./basic.nix
    ./develop/compiler.nix
    ./develop/nodejs.nix
    ./develop/android.nix
    ./develop/python.nix
    ./gaming.nix
  ];
}