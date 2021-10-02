neofetch

#{{{Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#}}}

for f in "$ZDOTDIR"/rc/*.sh; do source $f; done
for f in "$ZDOTDIR"/scripts/*.sh; do source $f; done
source "$(brew --prefix)/opt/fzf-tab/fzf-tab.plugin.zsh"
source "$(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme"
for f in "$ZDOTDIR"/"$(uname)"/zshrc*.sh; do source $f; done
export PATH="/opt/homebrew/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"
