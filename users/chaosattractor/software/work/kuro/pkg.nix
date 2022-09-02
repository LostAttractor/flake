{ stdenv, fetchurl, appimage-run, runtimeShell }:

stdenv.mkDerivation rec {
  pname = "kuro";
  version = "8.1.4";

  src = fetchurl {
    url = "https://github.com/davidsmorais/kuro/releases/download/v${version}/Kuro-${version}.AppImage";
    sha256 = "faec1b359823f57506a3ad4a7823224043211538ff707d2eca7dbfc9f2f14936";
  };

  buildInputs = [ appimage-run ];
  dontUnpack = true;

  installPhase = ''
    echo "#!${runtimeShell}" > kuro
    echo "${appimage-run}/bin/appimage-run $out/share/Kuro.AppImage" >> kuro
    echo '[Desktop Entry]
    Name=Kuro
    Exec=kuro
    Icon=kuro
    Type=Application
    Categories=Network;Utility;' >> Kuro.desktop
    install -D ${src} $out/share/Kuro.AppImage
    install -D kuro $out/bin/kuro
    install -D Kuro.desktop $out/share/applications/Kuro.desktop
  '';
}