{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "Layan-cursors";
  version = "2021-08-01";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = pname;
    rev = version;
    sha256 = "1bmjcjbn6aff2nv19jz7phlwjgj5w5lghjw79kr4lcrff91kjdr3";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r dist-border $out/share/icons/Layan-border-cursors
  '';

  meta = with lib; {
    description = "Layan cursors theme";
    homepage = "https://github.com/vinceliuice/Layan-cursors";
    license = licenses.gpl3Only;
    # darwin gives hash mismatch in source, probably because of file names differing only in case
    platforms = platforms.linux;
    maintainers = with maintainers; [ vinceliuice sandorex ];
  };
}