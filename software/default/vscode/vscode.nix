{ config, pkgs, ... }: 
{
    environment.systemPackages = with pkgs; [
        vscode 
        (vscode-with-extensions.override {
        # When the extension is already available in the default extensions set.
        vscodeExtensions = with vscode-extensions; [
            bbenoist.nix
            redhat.java
            matklad.rust-analyzer
            bungcip.better-toml
            ms-vscode.cpptools
            ms-python.python
            ms-python.vscode-pylance
            ms-toolsai.jupyter
            ms-toolsai.jupyter-renderers
            ms-azuretools.vscode-docker
            ms-vscode-remote.remote-ssh
            ms-ceintl.vscode-language-pack-zh-hans
            firefox-devtools.vscode-firefox-debug
            ms-vscode.PowerShell
            pkief.material-icon-theme
        ]
        # Concise version from the vscode market place when not available in the default set.
        ++ vscode-utils.extensionsFromVscodeMarketplace [
            {
                name = "doxdocgen";
                publisher = "cschlosser";
                version = "1.4.0";
                sha256 = "1d95znf2vsdzv9jqiigh9zm62dp4m9jz3qcfaxn0n0pvalbiyw92";
            }
            {
                name = "FreeMarker";
                publisher = "dcortes92";
                version = "0.0.9";
                sha256 = "1hkarlnknx3byinpxch9xzxyrys1l7d6fvagmcyb9r5bsw8x9hhh";
            }
            {
                name = "tokyo-night";
                publisher = "enkia";
                version = "0.9.4";
                sha256 = "0v1hkv8smwp64c0danrln39h0lgqa2dwiiy45rx29s9qmq3j9am4";
            }
            {
                name = "vscode-pull-request-github";
                publisher = "GitHub";
                version = "0.49.2022083109";
                sha256 = "029q58klz5574va6wr3nqs70al37rzyl0xdd9y6ks5qa3d9xvj98";
            }
            {
                name = "cmake-language-support-vscode";
                publisher = "josetr";
                version = "0.0.4";
                sha256 = "02z297823whvz1wnwx6pbcygv4cjddlkcdysln5sss109x8pgarq";
            }
            {
                name = "vscode-dotnet-runtime";
                publisher = "ms-dotnettools";
                version = "1.5.0";
                sha256 = "1rx2605zc1k5ygx3c0nsya2svg1n3gbagn08knnhqlki3zkil1gx";
            }
            {
                name = "jupyter-keymap";
                publisher = "ms-toolsai";
                version = "1.0.0";
                sha256 = "0wkwllghadil9hk6zamh9brhgn539yhz6dlr97bzf9szyd36dzv8";
            }
            {
                name = "remote-containers";
                publisher = "ms-vscode-remote";
                version = "0.250.0";
                sha256 = "1izc7vyz02an3m91w53ayr8lgwd3qrg233idlmy42vdhwgws2bzz";
            }
            {
                name = "remote-ssh-edit";
                publisher = "ms-vscode-remote";
                version = "0.80.0";
                sha256 = "0zgrd2909xpr3416cji0ha3yl6gl2ry2f38bvx4lsjfmgik0ic6s";
            }
            {
                name = "remote-wsl";
                publisher = "ms-vscode-remote";
                version = "0.66.3";
                sha256 = "0lslahxz5c6qxlv7xrq6da1x8ry297c4hgx0cb3iln6brj93j20a";
            }
            {
                name = "cmake-tools";
                publisher = "ms-vscode";
                version = "1.12.24";
                sha256 = "1dlg9yyvcf70k6ykvz0s7zlhm7qjvj6mv34bnl3gdwc1282rs42c";
            }
            {
                name = "cpptools-extension-pack";
                publisher = "ms-vscode";
                version = "1.2.0";
                sha256 = "155id1ln4nd14a5myw0b5qil4zprcwwplaxw8z7s6z24k7jqni9h";
            }
            {
                name = "vsliveshare";
                publisher = "ms-vsliveshare";
                version = "1.0.5696";
                sha256 = "1qxskqxfdwi4m6zn3bw2jxx4zbbci66v11dq13jl2sgbf5sfqpnk";
            }
            {
                name = "vsliveshare-audio";
                publisher = "ms-vsliveshare";
                version = "0.1.91";
                sha256 = "0p00bgn2wmzy9c615h3l3is6yf5cka84il5331z0rkfv2lzh6r7n";
            }
            {
                name = "es6-css-minify";
                publisher = "olback";
                version = "3.3.3";
                sha256 = "0s2ds3rrk9ynppaaka8pq1aa0bkpp5bmm2sv9ddnvcw8yjz2scqa";
            }
            {
                name = "cmake";
                publisher = "twxs";
                version = "0.0.17";
                sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
            }
            {
                name = "vscodeintellicode";
                publisher = "VisualStudioExptTeam";
                version = "1.2.24";
                sha256 = "17n30vwgdp6gcv2ycakh95ywfdxi5ip86lw915vslwjg274s9cay";
            }
            {
                name = "vscode-java-debug";
                publisher = "vscjava";
                version = "0.43.2022082909";
                sha256 = "1hk591jvaxgbxjbybwgzxbiw1w2sdhbx0gwk2ddn639xlvwh9cv7";
            }
            {
                name = "vscode-java-dependency";
                publisher = "vscjava";
                version = "0.21.2022080500";
                sha256 = "1p66lm3yn2jjv1yiy1d06p3icrac17gqgfzgpgi38krvdzakf04g";
            }
            {
                name = "vscode-java-pack";
                publisher = "vscjava";
                version = "0.25.2022082700";
                sha256 = "01p1h5mrc1p81ap4np3rdcw2yfiwc8828i6903m8hik3jf9irnin";
            }
            {
                name = "vscode-java-test";
                publisher = "vscjava";
                version = "0.37.2022083002";
                sha256 = "1jvxy6ihrw0rlvg6fk52ln9b8fbcjl77prz0a8d2hysdnnis6xnk";
            }
            {
                name = "vscode-maven";
                publisher = "vscjava";
                version = "0.38.2022082703";
                sha256 = "0ls8l4jwd8f3z9szvgdcyf4vrzxgg2bdm9yvga3mlyg2saxiz38b";
            }
            {
                name = "vscode-icons";
                publisher = "vscode-icons-team";
                version = "11.16.0";
                sha256 = "0fgpr356nbq8c2m8xqbhqnlgwrysc8cq78kngkmhv988hgm4kccv";
            }
        ];
        })
    ];
}