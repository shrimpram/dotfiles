{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.vistafonts;
      name = "Consolas NF";
      size = 13;
    };
    extraConfig = ''
      include current-theme.conf
      '';
    keybindings = {
      "kitty_mod+enter" = "new_window_with_cwd";
      "kitty_mod+n" = "next_window";
      "kitty_mod+p" = "previous_window";
      "kitty_mod+t" = "new_tab_with_cwd";
      "kitty_mod+." = "move_tab_forward";
      "kitty_mod+," = "move_tab_backward";
      "kitty_mod+i" = "set_tab_title";
      "kitty_mod+e>u" = "kitten hints";
      "kitty_mod+e>p" = "kitten hints --type path --program -";
      "kitty_mod+e>shift+p" = "kitten hints --type path";
      "kitty_mod+e>l" = "kitten hints --type line --program -";
      "kitty_mod+e>w" = "kitten hints --type word --program -";
      "kitty_mod+e>h" = "kitten hints --type hash --program -";
      "kitty_mod+e>n" = "kitten hints --type linenum";
      "kitty_mod+e>y" = "kitten hints --type hyperlink";
      "kitty_mod+g" = "show_last_command_output";
      "kitty_mod+s" = "focus_visible_window";
      "kitty_mod+m" = "swap_with_window";
      "kitty_mod+o" = "load_config_file";
      "kitty_mod+right" = "next_tab";
      "kitty_mod+left" = "previous_tab";
      "f5" = "load_config_file";
    };
    settings = {
      cursor_text_color = "background";
      disable_ligatures = "cursor";
      scrollback_pager = "nvim +Man!";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
      kitty_mod = "ctrl+super";
      hide_window_decorations = "yes";
      macos_option_as_alt = "yes";
      macos_quit_when_last_window_closed = "yes";
      shell_integration = "no-cursor";
      window_padding_width = "2";
    };
  };
  home.file = with config; {
    kitty-dark = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Shrimpram/stella/master/kitty/stella-dark.conf";
      };
      target = "${home.homeDirectory}/.config/kitty/themes/stella-dark.conf";
    };
    kitty-light = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Shrimpram/stella/master/kitty/stella-light.conf";
      };
      target = "${home.homeDirectory}/.config/kitty/themes/stella-light.conf";
    };
  };
}
