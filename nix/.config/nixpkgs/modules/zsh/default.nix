{ config, pkgs, ... }:
{
  home.file = with config; {
    todoist-comp = {
      source = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/urfave/cli/main/autocomplete/zsh_autocomplete";
      };
      target = "${home.homeDirectory}/.local/share/completion/zsh_autocomplete";
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    shellAliases = {
      e = "exa";
      ea = "exa --all";
      el = "exa --long --header --git --icons --classify --all";
      et = "exa --tree --level=2 --long --header --git --icons --classify --all";
      lg = "lazygit";
      ca = "khal calendar";
      p  = "pueue";
      tpw = "task due.before:eow or scheduled.before:eow";
      tls = "task $(task +LATEST uuids) annotate subtask: ";
      tld = "task add dep:$(task +LATEST uuids)";
      t = "todoist";
    };
    plugins = with pkgs; [
    {
      name = "fzf-tab";
      src = builtins.fetchGit {
        url = "https://github.com/aloxaf/fzf-tab";
        ref = "master";
      };
      file = "fzf-tab.plugin.zsh";
    }
    {
      name = "powerlevel10k";
      src = builtins.fetchGit {
        url = "https://github.com/romkatv/powerlevel10k";
        ref = "master";
        rev = "8a676a9157d2b0e00e88d06456ac7317f11c0317";
      };
      file = "powerlevel10k.zsh-theme";
    }
    {
      name = "todoist-fzf";
      src = builtins.fetchGit {
        url = "https://github.com/sachaos/todoist";
        ref = "master";
      };
      file = "todoist_functions_fzf.sh";
    }
    ];
    completionInit = ''
      autoload -Uz compinit bashcompinit
      compinit
      bashcompinit
      '';
    initExtraFirst = builtins.readFile ./p10k-source.zsh;
    initExtra =  ''
      autoload edit-command-line; zle -N edit-command-line
      bindkey '^e' edit-command-line
      eval "$(register-python-argcomplete pubs)"

      bindkey "^xt" fzf-todoist-item
      bindkey "^xp" fzf-todoist-project
      bindkey "^xl" fzf-todoist-labels
      bindkey "^xd" fzf-todoist-date
      bindkey "^xc" fzf-todoist-close
      bindkey "^xk" fzf-todoist-delete
      bindkey "^xo" fzf-todoist-open

      PROG=todoist source "$HOME/.local/share/completion/zsh_autocomplete"
      '' + builtins.readFile ./fzf-tab.zsh;
    initExtraBeforeCompInit = ''
      setopt globdots
      fpath+=(~/.nix-profile/share/zsh/site-functions/)
      fpath+=(~/.local/share/zsh/site-functions/)
      fpath+=(/opt/homebrew/share/zsh/site-functions)
      '';
  };
  programs.zoxide = {
    enable = true;
  };
}
