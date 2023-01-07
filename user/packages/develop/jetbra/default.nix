{ config, pkgs, ... }:
let
  jetbra = pkgs.fetchFromGitHub ({
    owner = "LostAttractor";
    repo = "jetbra";
    rev = "94585581c360862eab1843bf7edd8082fdf22542";
    sha256 = "sha256-9jeiF9QS4MCogIowu43l7Bqf7dhs40+7KKZML/k1oWo=";
  });

  vmoptions = ''
  -Xms128m
  -Xmx1024m
  -XX:ReservedCodeCacheSize=512m
  -XX:+IgnoreUnrecognizedVMOptions
  -XX:+UseG1GC
  -XX:SoftRefLRUPolicyMSPerMB=50
  -XX:CICompilerCount=2
  -XX:+HeapDumpOnOutOfMemoryError
  -XX:-OmitStackTraceInFastThrow
  -ea
  -Dsun.io.useCanonCaches=false
  -Djdk.http.auth.tunneling.disabledSchemes=""
  -Djdk.attach.allowAttachSelf=true
  -Djdk.module.illegalAccess.silent=true
  -Dkotlinx.coroutines.debug=off
  -XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
  -XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof

  --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
  --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

  -javaagent:${jetbra}/ja-netfilter.jar=jetbrains
  '';
in
{
  xdg.configFile."JetBrains/IntelliJIdea2022.2/idea64.vmoptions".text = vmoptions;
  xdg.configFile."JetBrains/PyCharm2022.2/pycharm64.vmoptions".text = vmoptions;
  xdg.configFile."JetBrains/CLion2022.2/clion64.vmoptions".text = vmoptions;

  # https://jetbra.in/5d84466e31722979266057664941a71893322460
}