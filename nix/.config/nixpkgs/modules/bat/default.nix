{ config, pkgs, ... }:
{
  programs.bat = {
    enable = true;
    themes = {
      stella = builtins.readFile (builtins.fetchGit {
        url = "https://github.com/stella-scheme/sublime";
        ref = "main";
      } + "/stella.tmTHeme");
    };
    config = {
      theme = "stella";
      style = "full";
      italic-text="always";
      wrap="never";
    };
  };
}
