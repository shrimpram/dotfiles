[ -f ~/.config/zsh/p10k-source.zsh ] && source ~/.config/zsh/p10k-source.zsh
[ -f ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f ~/.config/zsh/nnn.zsh ] && source ~/.config/zsh/nnn.zsh
[ -f ~/.config/zsh/fzf-tab-config.zsh ] && source ~/.config/zsh/fzf-tab-config.zsh

alias e="eza"
alias ea="eza --all"
alias el="eza --long --header --git --icons --classify --all"
alias et="eza --tree --level=2 --long --header --git --icons --classify --all"
alias lg="lazygit"
alias rem="reminders"
alias spt="spotify_player"

setopt globdots
setopt autocd

fpath+=(~/.local/share/zsh/site-functions/)
fpath+=(/opt/homebrew/share/zsh/site-functions)

autoload -Uz compinit bashcompinit
compinit
bashcompinit

autoload edit-command-line; zle -N edit-command-line
bindkey -e
bindkey '^e' edit-command-line

eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(/usr/libexec/path_helper)"

path+=(~/.local/bin)

path+=(~/.cargo/bin)

# Adds homebrew openjdk install to path
path=("/opt/homebrew/opt/openjdk/bin" $path)

# QMK tab completion
eval "$(register-python-argcomplete --no-defaults qmk)"
