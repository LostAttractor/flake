{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-vscode.cpptools
      ms-vscode-remote.remote-ssh
      rust-lang.rust-analyzer
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "gitlens";
        publisher = "eamodio";
        version = "2023.2.1404";
        sha256 = "08a4ch46rvsvn8q60qz61c1awxd36pq8971awfasl36b8j4g1k46";
      }
      {
        name = "vscode-pull-request-github";
        publisher = "GitHub";
        version = "0.59.2023020909";
        sha256 = "1hjrz5wh7ykh0w363ln74az0x56nw7vkphp2gx78gfgxvyanwv7b";
      }
      {
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.23.3";
        sha256 = "05lxa03hh5rslg7351dw87zlrp4drqy1jmpms1aml0yn1jxfb9yj";
      }
      {
        name = "vscode-language-pack-zh-hans";
        publisher = "MS-CEINTL";
        version = "1.75.2023020809";
        sha256 = "0sxy9ppm8jnpn82c7j0zk9rbw6swyv951js4w3qlp55sinm7rqd3";
      }
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.14.9";
        sha256 = "096arf7nrc6dg50kx6c507b0l9a8jns6bni6h0scyr6vbicdw96z";
      }
      {
        name = "cpptools-extension-pack";
        publisher = "ms-vscode";
        version = "1.3.0";
        sha256 = "11fk26siccnfxhbb92z6r20mfbl9b3hhp5zsvpn2jmh24vn96x5c";
      }
      {
        name = "cpptools-themes";
        publisher = "ms-vscode";
        version = "2.0.0";
        sha256 = "05r7hfphhlns2i7zdplzrad2224vdkgzb0dbxg40nwiyq193jq31";
      }
      {
        name = "material-icon-theme";
        publisher = "PKief";
        version = "4.24.0";
        sha256 = "0wqglzrby0idz4m3jzwsrlhnbgipg491wzzkpsvdc5z5d75bx744";
      }
      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "11hzjd0gxkq37689rrr2aszxng5l9fwpgs9nnglq3zhfa1msyn08";
      }
      {
        name = "material-theme";
        publisher = "zhuangtongfa";
        version = "3.15.7";
        sha256 = "1hxh5wg39h5k3p2cgh8vdh7l0pxsrw2cvfwbhsx8ifs8748qagi5";
      }
    ];
  };
}