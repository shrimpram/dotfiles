# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --long --header --git --icons --classify --all -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# preview nvim?
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --style="numbers,changes" --color=always $realpath'
