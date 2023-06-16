{ config, pkgs, ... }:
let
  inherit (pkgs.stdenv) isDarwin;

in
{
  services.nix-daemon.enable = true;

  users.users.shreeram.shell = pkgs.zsh;
  users.users.shreeram.home =
    if isDarwin then
      "/Users/shreeram"
    else
      "/home/shreeram";

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    eb-garamond
    garamond-libre
    ibm-plex
    sorts-mill-goudy
  ];

  home-manager.users.shreeram = {
    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "23.05";

# Packages {{{

    home.packages = with pkgs; [
      coreutils
      exa
      fd
      gawk
      gdu
      git-crypt
      git-lfs
      gnupg
      lazygit
      neofetch
      neovim
      passff-host
      ripgrep
      stow
      tasksh
      taskwarrior
      tree
      wget


      aria2
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

      texlive.combined.scheme-full

      # Mutt

      curl
      isync
      khard
      lynx
      # neomutt
      notmuch
      urlscan
      urlview
      msmtp
    ];

#}}}

    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less -r";
      MANPAGER = "nvim +Man!";
      KEYID = "0x163B16EE76ED24CE";
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
          pager = "${pkgs.neovim}/bin/nvim +Man!";
        };
      };
    };

    programs.fzf.enable = true;
    programs.fzf.enableZshIntegration = true;

# Kitty {{{
    programs.kitty = {
      enable = true;
      font = {
        name = "IBM Plex Mono";
        size = 12;
      };
      extraConfig = builtins.readFile ../conf/kitty-theme.conf;
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
#}}}

# Zsh {{{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    shellAliases = {
      e = "exa";
      ea = "exa --all";
      el = "exa --long --header --git --icons --classify --all";
      et = "exa --tree --level=2 --long --header --git --icons --classify --all";
      lg = "lazygit";
    };
    plugins = with pkgs; [
    {
      name = "fzf-tab";
      file = "fzf-tab.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "aloxaf";
        repo = "fzf-tab";
        rev = "c2b4aa5ad2532cca91f23908ac7f00efb7ff09c9";
        sha256 = "1b4pksrc573aklk71dn2zikiymsvq19bgvamrdffpf7azpq6kxl2";
      };
    }
    {
      name = "powerlevel10k";
      file = "powerlevel10k.zsh-theme";
      src = pkgs.fetchFromGitHub {
        owner = "romkatv";
        repo = "powerlevel10k";
        rev = "v1.18.0";
        sha256 = "1v0ig9i783b8xjxaz2jq48rqg297wvgzz3p7a8drxyn5wwcih8r2";
      };
    }
    ];
    completionInit = ''
      autoload -Uz compinit bashcompinit
      compinit
      bashcompinit
      '';
    initExtraFirst = builtins.readFile ../conf/p10k-source.zsh;
    initExtra =  ''
      autoload edit-command-line; zle -N edit-command-line
      bindkey '^e' edit-command-line

      export NNN_FIFO=/tmp/nnn.fifo

      n () {
          # Block nesting of nnn in subshells
          [ "$NNNLVL" -eq 0 ] || {
              echo "nnn is already running"
              return
          }

          # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
          # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
          # see. To cd on quit only on ^G, remove the "export" and make sure not to
          # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
          #      NNN_TMPFILE="$HOME/.config/nnn/.lastd"
          export NNN_TMPFILE="$HOME/.config/nnn/.lastd"

          # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
          # stty start undef
          # stty stop undef
          # stty lwrap undef
          # stty lnext undef

          # The command builtin allows one to alias nnn to n, if desired, without
          # making an infinitely recursive alias
          command nnn -egxAH "$@"

          [ ! -f "$NNN_TMPFILE" ] || {
              . "$NNN_TMPFILE"
              rm -f "$NNN_TMPFILE" > /dev/null
          }
      }
      '' + builtins.readFile ../conf/fzf-tab.zsh;
    initExtraBeforeCompInit = ''
      setopt globdots
      fpath+=(~/.nix-profile/share/zsh/site-functions/)
      fpath+=(~/.local/share/zsh/site-functions/)
      fpath+=(/opt/homebrew/share/zsh/site-functions)
      '';
  };

#}}}

# Nnn {{{
    programs.nnn = {
      enable = true;
      plugins = {
        mappings = {
          f = "fzopen";
          p = "preview-tui";
          d = "pdfview";
        };
        src = (pkgs.fetchFromGitHub {
            owner = "jarun";
            repo = "nnn";
            rev = "v4.0";
            sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
            }) + "/plugins";
      };
    };
#}}}

    programs.password-store = {
      enable = true;
      package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
      settings = {
        PASSWORD_STORE_DIR = "$HOME/.password-store";
      };
    };

    programs.browserpass = {
      enable = true;
      browsers = [
        "chromium"
        "firefox"
      ];
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      package = pkgs.zoxide;
    };
  };
}
