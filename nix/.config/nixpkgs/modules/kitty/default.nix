{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.hasklig;
      name = "Hasklig";
      size = 13;
    };
    extraConfig = ''
      cursor #B4A5C8
      foreground #998BAD
      background #2B213C
      color0 #2B213C
      color8 #534566
      color1 #C8917B
      color9 #C8917B
      color2  #ACC79B
      color10 #ACC79B
      color3  #C7C17D
      color11 #C7C17D
      color4  #A4A8D8
      color12 #A4A8D8
      color5  #C994FF
      color13 #C994FF
      color6  #9BBFD4
      color14 #9BBFD4
      color7  #888098
      color15 #BDB6C7
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
    };
    settings = {
      cursor_text_color = "background";
      disable_ligatures = "cursor";
      scrollback_pager = "nvim +Man!";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";
      kitty_mod = "ctrl+super";
      macos_titlebar_color = "background";
      macos_option_as_alt = "yes";
      shell_integration = "no-cursor";
    };
  };
}
