if [ -e /Users/shreeram/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/shreeram/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


export GPG_TTY=$TTY
export KEYID=0x163B16EE76ED24CE

export PAGER="less -R"

export EDITOR="nvim"
export VISUAL="nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add environment variables for the XDG directory specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

for f in "$ZDOTDIR"/"$(uname)"/zshenv*.sh; do source "$f"; done


#{{{Exporting to Path

# Go
path+=("/usr/local/go/bin")
path+=("$HOME/go/bin")

# Adds cargo binaries to path
path+=("$HOME/.cargo/bin")

#}}}

#{{{Exporting Env Vars

# nnn
export NNN_FIFO=/tmp/nnn.fifo
export NNN_USE_EDITOR=1
export NNN_PLUG='f:fzopen;p:preview-tui;d:pdfview;'

#}}}

export PATH="/opt/homebrew/bin:$PATH"

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"
