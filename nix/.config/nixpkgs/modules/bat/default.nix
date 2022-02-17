{ config, pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      style = "full";
      italic-text = "always";
      wrap = "never";
    };
  };
}
