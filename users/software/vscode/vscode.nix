{ config, pkgs, ... }: 
{
	nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        vscode 
        # (vscode-with-extensions.override {
        # # When the extension is already available in the default extensions set.
        # vscodeExtensions = with vscode-extensions; [
        #     bbenoist.nix
        #     redhat.java
        #     matklad.rust-analyzer
        #     bungcip.better-toml
        #     ms-vscode.cpptools
        #     ms-python.python
        #     ms-python.vscode-pylance
        #     ms-toolsai.jupyter
        #     ms-toolsai.jupyter-renderers
        #     ms-azuretools.vscode-docker
        #     ms-vscode-remote.remote-ssh
        #     ms-ceintl.vscode-language-pack-zh-hans
        #     firefox-devtools.vscode-firefox-debug
        #     ms-vscode.PowerShell
        #     pkief.material-icon-theme
        #     yzhang.markdown-all-in-one
        #     zhuangtongfa.material-theme
        #     ms-vsliveshare.vsliveshare
        #     github.vscode-pull-request-github
        #     eamodio.gitlens
        #     dbaeumer.vscode-eslint
        #     davidanson.vscode-markdownlint
        # ]
        # # Concise version from the vscode market place when not available in the default set.
        # ++ vscode-utils.extensionsFromVscodeMarketplace [
        #     {
        #         name = "vscode-snazzy-operator";
        #         publisher = "aaronthomas";
        #         version = "1.1.3";
        #         sha256 = "105rc3ixpq6hqzxyzsp0zhvzxgqx1p9bxck8mpn7xkkd1pwim281";
        #     }
        #     {
        #         name = "npm-intellisense";
        #         publisher = "christian-kohler";
        #         version = "1.4.2";
        #         sha256 = "0bkgc9fkfpk2mnmr4f7f7c458i1cniy940s5nxap029ysnp6c0yw";
        #     }
        #     {
        #         name = "doxdocgen";
        #         publisher = "cschlosser";
        #         version = "1.4.0";
        #         sha256 = "1d95znf2vsdzv9jqiigh9zm62dp4m9jz3qcfaxn0n0pvalbiyw92";
        #     }
        #     {
        #         name = "FreeMarker";
        #         publisher = "dcortes92";
        #         version = "0.0.9";
        #         sha256 = "1hkarlnknx3byinpxch9xzxyrys1l7d6fvagmcyb9r5bsw8x9hhh";
        #     }
        #     {
        #         name = "tokyo-night";
        #         publisher = "enkia";
        #         version = "0.9.4";
        #         sha256 = "0v1hkv8smwp64c0danrln39h0lgqa2dwiiy45rx29s9qmq3j9am4";
        #     }
        #     {
        #         name = "cmake-language-support-vscode";
        #         publisher = "josetr";
        #         version = "0.0.4";
        #         sha256 = "02z297823whvz1wnwx6pbcygv4cjddlkcdysln5sss109x8pgarq";
        #     }
        #     {
        #         name = "noctis";
        #         publisher = "liviuschera";
        #         version = "10.40.0";
        #         sha256 = "1ry0vkyb92c6p6i8dpjq7sihvbpl45gngb8fym22nylmnfi9dcai";
        #     }
        #     {
        #         name = "vscode-dotnet-runtime";
        #         publisher = "ms-dotnettools";
        #         version = "1.5.0";
        #         sha256 = "1rx2605zc1k5ygx3c0nsya2svg1n3gbagn08knnhqlki3zkil1gx";
        #     }
        #     {
        #         name = "jupyter-keymap";
        #         publisher = "ms-toolsai";
        #         version = "1.0.0";
        #         sha256 = "0wkwllghadil9hk6zamh9brhgn539yhz6dlr97bzf9szyd36dzv8";
        #     }
        #     {
        #         name = "remote-containers";
        #         publisher = "ms-vscode-remote";
        #         version = "0.252.0";
        #         sha256 = "1yrjfxccvg7j64l47ixzc7r1234r7nqk0j3500a8ihfi6qi7cxx5";
        #     }
        #     {
        #         name = "remote-ssh-edit";
        #         publisher = "ms-vscode-remote";
        #         version = "0.80.0";
        #         sha256 = "0zgrd2909xpr3416cji0ha3yl6gl2ry2f38bvx4lsjfmgik0ic6s";
        #     }
        #     {
        #         name = "remote-wsl";
        #         publisher = "ms-vscode-remote";
        #         version = "0.66.3";
        #         sha256 = "0lslahxz5c6qxlv7xrq6da1x8ry297c4hgx0cb3iln6brj93j20a";
        #     }
        #     {
        #         name = "cmake-tools";
        #         publisher = "ms-vscode";
        #         version = "1.13.1";
        #         sha256 = "0p4ldcf8jy6wr74nsx2x126ik77isgirgswc3d7sdr04436fcj2f";
        #     }
        #     {
        #         name = "cpptools-extension-pack";
        #         publisher = "ms-vscode";
        #         version = "1.3.0";
        #         sha256 = "11fk26siccnfxhbb92z6r20mfbl9b3hhp5zsvpn2jmh24vn96x5c";
        #     }
        #     {
        #         name = "vsliveshare-audio";
        #         publisher = "ms-vsliveshare";
        #         version = "0.1.91";
        #         sha256 = "0p00bgn2wmzy9c615h3l3is6yf5cka84il5331z0rkfv2lzh6r7n";
        #     }
        #     {
        #         name = "es6-css-minify";
        #         publisher = "olback";
        #         version = "3.3.3";
        #         sha256 = "0s2ds3rrk9ynppaaka8pq1aa0bkpp5bmm2sv9ddnvcw8yjz2scqa";
        #     }
        #     {
        #         name = "synthwave-vscode";
        #         publisher = "RobbOwen";
        #         version = "0.1.14";
        #         sha256 = "0d9c18ci1pgj1qxm8xhdw6rp5gn135l1rvmd591gr3bsrmcf5wj7";
        #     }
        #     {
        #         name = "cmake";
        #         publisher = "twxs";
        #         version = "0.0.17";
        #         sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
        #     }
        #     {
        #         name = "intellicode-api-usage-examples";
        #         publisher = "VisualStudioExptTeam";
        #         version = "0.2.2";
        #         sha256 = "1wfn4mg4vcv2jyhhr0b525k7xa3hkhb7m47xrqm7cqav641vzagz";
        #     }
        #     {
        #         name = "vscodeintellicode";
        #         publisher = "VisualStudioExptTeam";
        #         version = "1.2.24";
        #         sha256 = "17n30vwgdp6gcv2ycakh95ywfdxi5ip86lw915vslwjg274s9cay";
        #     }
        #     {
        #         name = "vscode-java-debug";
        #         publisher = "vscjava";
        #         version = "0.44.2022090107";
        #         sha256 = "16vzm803v6wwr1p8p4rf9xqhz5kz64ssbhakm9pw93nva9dv64i9";
        #     }
        #     {
        #         name = "vscode-java-dependency";
        #         publisher = "vscjava";
        #         version = "0.21.2022090100";
        #         sha256 = "0vsiavi76pib47gwkp1n50d1c4ivqamz86fyliw9h12pn3i60wgr";
        #     }
        #     {
        #         name = "vscode-java-pack";
        #         publisher = "vscjava";
        #         version = "0.25.2022082700";
        #         sha256 = "01p1h5mrc1p81ap4np3rdcw2yfiwc8828i6903m8hik3jf9irnin";
        #     }
        #     {
        #         name = "vscode-java-test";
        #         publisher = "vscjava";
        #         version = "0.37.2022090202";
        #         sha256 = "1yzlh6nl2cx8mp35z5bvipsmn8f35956n7s8sp8ij5vxdx50bigb";
        #     }
        #     {
        #         name = "vscode-maven";
        #         publisher = "vscjava";
        #         version = "0.38.2022082703";
        #         sha256 = "0ls8l4jwd8f3z9szvgdcyf4vrzxgg2bdm9yvga3mlyg2saxiz38b";
        #     }
        #     {
        #         name = "vscode-icons";
        #         publisher = "vscode-icons-team";
        #         version = "11.16.0";
        #         sha256 = "0fgpr356nbq8c2m8xqbhqnlgwrysc8cq78kngkmhv988hgm4kccv";
        #     }
        # ];
        # })
    ];
}