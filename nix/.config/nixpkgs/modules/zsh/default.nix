{ config, pkgs, ... }:
{
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
      ca = "gcalcli";
      p  = "pueue";
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
