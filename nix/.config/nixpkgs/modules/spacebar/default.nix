{ config, pkgs, ... }:
{
  home.file = with config; {
    spacebar-dark = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Shrimpram/stella/master/spacebar/stella-dark";
      };
      target = "${home.homeDirectory}/.config/spacebar/themes/stella-dark";
      executable = true;
    };
    spacebar-light = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Shrimpram/stella/master/spacebar/stella-light";
      };
      target = "${home.homeDirectory}/.config/spacebar/themes/stella-light";
      executable = true;
    };
  };
}
