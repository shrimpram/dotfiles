# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.nix-profile/bin/fzf* ]]; then
  export PATH="${PATH:+${PATH}:}~/.nix-profile/bin/fzf"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.nix-profile/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.nix-profile/share/fzf/key-bindings.zsh"
