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

  bat
  coreutils
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
  nnn
  pass
  ripgrep
  stow
  tree
  wget
  zoxide
  zsh
  zsh-fzf-tab
  zsh-powerlevel10k


  # Opt

  haste-client
  hugo
  terminal-notifier
  imagemagick
  moreutils
  pandoc
  poppler_utils
  gnuplot
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

  # Workflow

  taskwarrior
  taskwarrior-tui

  ## Mutt

  curl
  isync
  lynx
  msmtp
  neomutt
  notmuch
  urlview

  ];


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
}
