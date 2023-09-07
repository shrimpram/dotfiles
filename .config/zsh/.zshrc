[ -f ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f ~/.config/zsh/p10k-source.zsh ] && source ~/.config/zsh/p10k-source.zsh
[ -f ~/.config/zsh/nnn.zsh ] && source ~/.config/zsh/nnn.zsh
[ -f ~/.config/zsh/fzf-tab-config.zsh ] && source ~/.config/zsh/fzf-tab-config.zsh

alias e="exa"
alias ea="exa --all"
alias el="exa --long --header --git --icons --classify --all"
alias et="exa --tree --level=2 --long --header --git --icons --classify --all"
alias lg="lazygit"

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


# Forces openjdk@17 to appear first in path
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
