{ config, pkgs, ... }:
{
  imports = [
    ./modules/kitty
    ./modules/git
    ./modules/nnn
    ./modules/zsh
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "shreeram";
    homeDirectory = "/Users/shreeram";
    stateVersion = "21.11";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less -r";

      KEYTIMEOUT = 1;

      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";

      GPG_TTY = "$TTY";
      KEYID = "0x163B16EE76ED24CE";
    };
    sessionPath = [
      "/usr/local/bin"
      "$HOME/.local/bin"
      "/opt/homebrew/bin"
      "/usr/local/texlive/2021/bin/universal-darwin"
    ];
    packages = with pkgs; [
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
        neovim
        ripgrep
        stow
        tree
        wget


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

        # Mutt

        curl
        isync
        lynx
        msmtp
        neomutt
        notmuch
        urlview
        ];
  };

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

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };
}
