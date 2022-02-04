{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "shreeram";
  home.homeDirectory = "/Users/shreeram";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  home.packages = with pkgs; [

  # Core

  coreutils
  emacs
  exa
  fd
  fzf
  gawk
  gdu
  git-crypt
  git-lfs
  gnupg
  htop
  lazygit
  neofetch
  nnn
  ripgrep
  stow
  tree
  wget
  zoxide
  zsh
  zsh-fzf-tab
  zsh-powerlevel10k


  # Opt

  gnuplot
  haste-client
  hugo
  imagemagick
  moreutils
  pandoc
  pdftk
  poppler_utils
  terminal-notifier
  tesseract
  youtube-dl

  # Lang

  asciidoc
  asciidoctor
  lua53Packages.luarocks
  nodePackages.write-good
  python38
  ruby
  rustc
  shellcheck
  stylua
  vim-vint

  # Emacs

  automake
  hunspell
  mu
  openssl
  pkg-config

  ## Mutt

  curl
  isync
  lynx
  msmtp
  neomutt
  notmuch
  urlview

  ];

  programs.bat = {
    enable = true;
    themes = {
      stella = builtins.readFile (pkgs.fetchFromGitHub {
          owner = "stella-scheme";
          repo = "sublime";
          rev = "534e49d5fde85c722c754cbb779f818f53cc7226";
          sha256 = "02vw2igvpjwd1c7hjxrd74ayadlyspy2z0wd1c3wvbjmq851qnnc";
          } + "/stella.tmTheme");
    };
    config = {
      theme = "stella";
      style = "full";
      italic-text="always";
      wrap="never";
    };
  };

  programs.git = {
    enable = true;
    userName = "Shreeram Modi";
    userEmail = "67710369+Shrimpram@users.noreply.github.com";
    signing.key = "0x163B16EE76ED24CE";
    lfs.enable = true;
    ignores = [ ".DS_Store" "*.icloud" "*.auctex-auto/" ];
    extraConfig = {
      core = {
        pager = "${pkgs.less}/bin/less";
      };

      pull.rebase = true;

      "filter \"lfs\"" = {
        clean = "${pkgs.git-lfs}/bin/git-lfs clean -- %f";
        smudge = "${pkgs.git-lfs}/bin/git-lfs smudge --skip -- %f";
        required = true;
      };
    };
  };


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

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };
}
