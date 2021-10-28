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
  git-crypt
  git-lfs
  gnupg
  gnused
  htop
  lazygit
  neofetch
  neovim
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

  haste-client
  hugo
  imagemagick
  moreutils
  pandoc
  poppler
  tesseract
  youtube-dl

  # Lang

  asciidoc
  asciidoctor
  lua53Packages.luarocks
  python38
  ruby
  rustc
  shellcheck
  stylua
  vim-vint
  nodePackages.write-good

  # Emacs

  automake
  hunspell
  isync
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
  pass
  urlview

  ];
}
