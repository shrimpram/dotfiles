{ config, pkgs, ... }:
{
  imports = [
    ./modules/bat
    ./modules/fzf
    ./modules/git
    ./modules/kitty
    ./modules/nnn
    ./modules/password-store
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
}
