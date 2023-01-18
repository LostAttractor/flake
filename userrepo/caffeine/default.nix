{ lib
, stdenv
, fetchFromGitHub
, glib
, gettext
}:

let
  name = "caffeine";
  pname = "gnome-shell-extension-${name}";
  uuid = "caffeine@patapon.info";
  version = "master";
in
stdenv.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "eonpatapon";
    repo = pname;
    rev = "b9f4f0ba926854cab050429315754b66b1d82ab7";
    sha256 = "sha256-F4kjygu5yi//sLKnFnzwMpkdRaI4C4O+JRGMNjvUhzM=";
  };

  patches = [
    ./caffeine.patch
  ];

  nativeBuildInputs = [
    glib
    gettext
  ];
  
  makeFlags = [ "INSTALLBASE=$(out)/share/gnome-shell/extensions" ];

  passthru = {
    extensionPortalSlug = name;
    # Store the extension's UUID, because we might need it at some places
    extensionUuid = uuid;
  };

  meta = {
    description = "A tools to disable screensaver and auto suspend";
    homepage = https://github.com/eonpatapon/gnome-shell-extension-caffeine/;
    license = lib.licenses.gpl2Plus; # https://wiki.gnome.org/Projects/GnomeShell/Extensions/Review#Licensing
    maintainers = with lib.maintainers; [ piegames ];
  };
}
