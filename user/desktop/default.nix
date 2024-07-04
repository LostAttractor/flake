_: {
  # Enable Wayland for Chromium (CEF) Apps
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  # Using vulkan renderer for gtk4
  home.sessionVariables.GSK_RENDERER = "vulkan";

  nixpkgs.overlays = [
    (final: prev: {
      chromium = prev.chromium.override {
        commandLineArgs = [
          "--enable-wayland-ime"
          "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
        ];
      };
      google-chrome = prev.google-chrome.override {
        commandLineArgs = [
          "--enable-wayland-ime"
          "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
        ];
      };
      brave = prev.brave.override { commandLineArgs = [ "--enable-wayland-ime" ]; };
      vscode = prev.vscode.override { commandLineArgs = [ "--enable-wayland-ime" ]; };
      qq = prev.qq.override { commandLineArgs = [ "--enable-wayland-ime" ]; };

      signal-desktop = prev.signal-desktop.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
          '';
      });

      element-desktop = prev.element-desktop.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
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
                --add-flags "--enable-wayland-ime"
            '';
        });

      logseq = prev.logseq.overrideAttrs (oldAttrs: {
        postFixup =
          oldAttrs.postFixup or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
          '';
      });

      obsidian = prev.obsidian.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.pname} \
              --add-flags "--enable-wayland-ime"
          '';
      });

      marktext = prev.marktext.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
          '';
      });

      kuro = prev.kuro.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
          '';
      });

      github-desktop = prev.github-desktop.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
          '';
      });

      bitwarden = prev.bitwarden.overrideAttrs (oldAttrs: {
        postInstall =
          oldAttrs.postInstall or ""
          + ''
            wrapProgram $out/bin/${oldAttrs.meta.mainProgram} \
              --add-flags "--enable-wayland-ime"
          '';
      });
    })
  ];
}
