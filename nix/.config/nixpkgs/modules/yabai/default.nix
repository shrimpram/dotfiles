{ config, pkgs, ... }:
{
  home.file = with config; {
    yabai-dark = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Shrimpram/stella/master/yabai/stella-dark";
      };
      target = "${home.homeDirectory}/.config/yabai/themes/stella-dark";
      executable = true;
    };
    yabai-light = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Shrimpram/stella/master/yabai/stella-light";
      };
      target = "${home.homeDirectory}/.config/yabai/themes/stella-light";
      executable = true;
    };
  };
}
