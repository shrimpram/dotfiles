{ config, pkgs, ... }:
{
  imports = [
    ./modules/bat
    ./modules/fzf
    ./modules/git
    ./modules/kitty
    ./modules/nnn
    ./modules/password-store
    ./modules/spacebar
    ./modules/yabai
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
      MANPAGER = "nvim +Man!";

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
      "$HOME/Library/Python/3.8/bin"
      "$HOME/Library/Python/3.9/bin"
      "$HOME/.gem/ruby/2.6.0/bin"
      "$HOME/.gem/ruby/2.7.0/bin"
      "$HOME/go/bin"
    ];
    packages = with pkgs; [
        # Core

        coreutils
        emacs
        exa
        fd
        gawk
        gdu
        git-crypt
        git-lfs
        gnupg
        hledger
        htop
        lazygit
        neofetch
        neovim
        ripgrep
        stow
        tree
        wget


        # Opt

        aria2
        gnuplot
        haste-client
        hugo
        imagemagick
        moreutils
        pandoc
        pdftk
        poppler_utils
        pubs
        python39Packages.argcomplete
        spotify-tui
        spotifyd
        terminal-notifier
        tesseract
        vdirsyncer
        zathura

        # Lang

        R
        asciidoc
        asciidoctor
        go
        jq
        lua
        lua53Packages.luarocks
        nodePackages.write-good
        nodejs
        python38
        pythonPackages.httplib2
        ruby
        rustc
        shellcheck
        stylua
        texlive.combined.scheme-full
        vim-vint
        yq

        # Emacs

        automake
        hunspell
        mu
        openssl
        pkg-config

        # Mutt

        curl
        isync
        khard
        lynx
        msmtp
        neomutt
        notmuch
        urlview
        ];
  };
}
