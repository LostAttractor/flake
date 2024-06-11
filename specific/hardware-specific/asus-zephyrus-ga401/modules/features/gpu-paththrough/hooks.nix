{ pkgs, ... }:
{
  # Load Hooks for Libvirt
  systemd.services.libvirtd.preStart =
    let
      qemuHook = pkgs.writeScript "qemu-hook" ''
        #!${pkgs.stdenv.shell}

        GUEST_NAME="$1"
        HOOK_NAME="$2"
        STATE_NAME="$3"
        MISC="$\{@:4}"

        BASEDIR="$(dirname $0)"

        HOOKPATH="$BASEDIR/qemu.d/$GUEST_NAME/$HOOK_NAME/$STATE_NAME"
        set -e # If a script exits with an error, we should as well.

        if [ -f "$HOOKPATH" ]; then
        eval \""$HOOKPATH"\" "$@"
        elif [ -d "$HOOKPATH" ]; then
        while read file; do
          eval \""$file"\" "$@"
        done <<< "$(find -L "$HOOKPATH" -maxdepth 1 -type f -executable -print;)"
        fi
      '';
    in
    ''
      mkdir -p /var/lib/libvirt/hooks
      chmod 755 /var/lib/libvirt/hooks

      # Copy hook files
      ln -sf ${qemuHook} /var/lib/libvirt/hooks/qemu
      cp -rfT ${./qemu.d} /var/lib/libvirt/hooks/qemu.d

      # Make executable
      chmod -R +x /var/lib/libvirt/hooks/qemu.d/
    '';
}
