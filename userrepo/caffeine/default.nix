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

  nativeBuildInputs = [
    glib
    gettext
  ];

  buildPhase = ''
    runHook preBuild
    sh ./update-locale.sh
    glib-compile-schemas --strict --targetdir=caffeine@patapon.info/schemas/ caffeine@patapon.info/schemas
    runHook postBuild
  '';
  
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/gnome-shell/extensions/
    cp -r -T ${uuid} $out/share/gnome-shell/extensions/${uuid}
    runHook postInstall
  '';

  meta = {
    description = "A tools to disable screensaver and auto suspend";
    homepage = https://github.com/eonpatapon/gnome-shell-extension-caffeine/;
    license = lib.licenses.gpl2Plus; # https://wiki.gnome.org/Projects/GnomeShell/Extensions/Review#Licensing
    maintainers = with lib.maintainers; [ piegames ];
  };
  passthru = {
    extensionPortalSlug = name;
    # Store the extension's UUID, because we might need it at some places
    extensionUuid = uuid;
  };
}
