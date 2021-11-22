export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

fpath+=(~/.nix-profile/share/zsh/site-functions/)

autoload -Uz compinit
compinit
