{ pkgs, ... }:
let
  jetbra = pkgs.fetchFromGitHub {
    owner = "LostAttractor";
    repo = "jetbra";
    rev = "94585581c360862eab1843bf7edd8082fdf22542";
    sha256 = "sha256-9jeiF9QS4MCogIowu43l7Bqf7dhs40+7KKZML/k1oWo=";
  };

  vmoptions = ''
  --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
  --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

  -javaagent:${jetbra}/ja-netfilter.jar=jetbrains
  '';
in
{
  xdg.configFile."JetBrains/IntelliJIdea2023.1/idea64.vmoptions".text = vmoptions;
  xdg.configFile."JetBrains/PyCharm2023.1/pycharm64.vmoptions".text = vmoptions;
  xdg.configFile."JetBrains/CLion2023.1/clion64.vmoptions".text = vmoptions;

  # https://jetbra.in/5d84466e31722979266057664941a71893322460
}