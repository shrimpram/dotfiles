{ config, pkgs, ... }:
{

# Homebrew ----------------------------------------------------------------------------------------------------{{{

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    global.brewfile = true;

    taps = [
      "homebrew/core"
        "homebrew/cask"
    ];

    brews = [
      "cmacrae/formulae/spacebar"
      "koekeishiya/formulae/skhd"
      "koekeishiya/formulae/yabai"
      "neomutt"
    ];

    casks = [
      "alfred"
      "dropbox"
      "flux"
      "iina"
      "logseq"
      "obsidian"
      "raycast"
      "skim"
      "slack"
    ];
  };

#}}}

# Services ----------------------------------------------------------------------------------------------------{{{
services = {

# Yabai ----------------------------------------------------------------------------------------------------{{{
  yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";
      window_origin_display = "default";
      window_placement = "second_child";
      window_topmost = "off";
      window_shadow = "off";
      window_opacity = "off";
      window_opacity_duration = "0.0";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.90";
      window_border = "on";
      window_border_blur = "off";
      insert_feedback_color = "0xFFCCA37E";
      split_ratio = "0.50";
      auto_balance = "off";
      mouse_modifier = "ctrl";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "stack";

      layout = "bsp";
      top_padding = "0";
      bottom_padding = "0";
      left_padding = "0";
      right_padding = "0";
      window_gap = "0";
      external_bar = "all:24:0";

      active_window_border_color = "0xFFBE9EE2";
      normal_window_border_color = "0xFF2B213C";

      extraConfig = ''
        yabai -m rule --add app="^Disk Utility$" manage=off
        yabai -m rule --add app="^Flux$" manage=off
        yabai -m rule --add app="^Raycast$" manage=off
        yabai -m rule --add app="^Spotify*" space=last
        yabai -m rule --add app="^Music*" space=first native-fullscreen=on
        yabai -m rule --add app="^Discord*" space=last
        yabai -m rule --add app="^System Settings$" manage=on
        yabai -m rule --add app="^Emacs$" manage=on
        yabai -m rule --add app="^Steam$" manage=off
        yabai -m rule --add app="^Finda$" manage=off
        '';
    };
  };
#}}}

# Spacebar ----------------------------------------------------------------------------------------------------{{{
  spacebar = {
    enable = false;
    package = pkgs.spacebar;
    config = {
      position = "top";
      height = "24";
      title = "on";
      spaces = "on";
      clock = "on";
      power = "on";
      dnd = "on";
      padding_left = "20";
      padding_right = "20";
      spacing_left = "25";
      spacing_right = "15";
      text_font = "IBM Plex Sans:Bold:13.0";
      icon_font = "IBM Plex Sans:Bold:15.0";
      power_icon_strip = " ";
      space_icon_strip = "I II III IV V VI VII VIII IX X";
      space_icon = "";
      clock_icon = "";
      dnd_icon = "";
      clock_format = "%a %D %I:%M %p";
      left_shell = "on";
      left_shell_command = "echo $(whoami)@$(hostname)";
      right_shell = "on";
      right_shell_icon = "";
      right_shell_command = "defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/'";
      background_color = "0xFF2B213C";
      foreground_color = "0xFFB2A8B6";
      space_icon_color = "0xFF9BBFD4";
      power_icon_color = "0xFFC7C17D";
      battery_icon_color = "0xFFC8917B";
      dnd_icon_color = "0xFFBE9EE2";
      clock_icon_color = "0xFF958DA2";
    };
  };
#}}}

# Skhd {{{
  skhd.enable = true;
  skhd.skhdConfig = builtins.readFile ../conf/skhd.conf;
#}}}

};
#}}}

}
