{ inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w" # wechat-uos
    "electron-27.3.11"
    "electron-unwrapped-27.3.11"
    "electron-29.4.6"
    "jitsi-meet-1.0.8043"
    "cinny-4.2.3"
    "cinny-unwrapped-4.2.3"
  ];

  nixpkgs.overlays = [
    inputs.nur.overlays.default
    inputs.nix-vscode-extensions.overlays.default

    (final: prev: {
      chromium = prev.chromium.override {
        commandLineArgs = [
          "--wayland-text-input-version=3"
          "--enable-features=VaapiVideoDecoder"
        ];
      };
      google-chrome = prev.google-chrome.override {
        commandLineArgs = [
          "--wayland-text-input-version=3"
          "--enable-features=VaapiVideoDecoder"
        ];
      };
      brave = prev.brave.override {
        commandLineArgs = [
          "--wayland-text-input-version=3"
          "--enable-features=VaapiVideoDecoder"
        ];
      };
      vscode = prev.vscode.override { commandLineArgs = [ "--wayland-text-input-version=3" ]; };
      qq = prev.qq.override { commandLineArgs = [ "--wayland-text-input-version=3" ]; };

      signal-desktop = prev.signal-desktop.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      element-desktop = prev.element-desktop.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      discord =
        let
          binaryName = prev.discord.meta.mainProgram;
        in
        prev.discord.overrideAttrs (oldAttrs: {
          postInstall =
            oldAttrs.postInstall or ""
            + ''
              wrapProgram $out/opt/${binaryName}/${binaryName} \
                --add-flags "--wayland-text-input-version=3"
            '';
        });

      logseq = prev.logseq.overrideAttrs (oldAttrs: {
        postFixup =
          oldAttrs.postFixup or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      obsidian = prev.obsidian.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.pname} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      marktext = prev.marktext.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      kuro = prev.kuro.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      github-desktop = prev.github-desktop.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });

      bitwarden = prev.bitwarden.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--wayland-text-input-version=3"
          '';
      });
    })
  ];
}