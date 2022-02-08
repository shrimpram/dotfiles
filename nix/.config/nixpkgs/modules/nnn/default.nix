{ config, pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    plugins = {
      mappings = {
        f = "fzopen";
        p = "preview-tui";
        d = "pdfview";
      };
      src = (builtins.fetchGit {
          url = "https://github.com/jarun/nnn";
          ref = "master";
          rev = "65eddfe7b9f02f685145005a8ffd3feb8d102ced";
          }) + "/plugins";
    };
  };
  programs.zsh.initExtra = ''
    export NNN_FIFO=/tmp/nnn.fifo
  '' + builtins.readFile ./nnn.zsh;
}
