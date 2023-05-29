{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Shreeram Modi";
    userEmail = "67710369+Shrimpram@users.noreply.github.com";
    signing.key = "0x163B16EE76ED24CE";
    lfs.enable = true;
    ignores = [ ".DS_Store" "*.icloud" "*.auctex-auto/" ];
    extraConfig = {
      core = {
        pager = "${pkgs.neovim}/bin/nvim +Man!";
      };
    };
  };
}
