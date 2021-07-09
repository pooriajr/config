# Posix stuff that isn't zsh specific
source $HOME/.profile

export EDITOR=nvim

ENABLE_CORRECTION="true"
setopt auto_cd

export BAT_THEME="Nord"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Prompt
autoload -U promptinit; promptinit
prompt pure

# Enable Ctrl-v to edit command line with $EDITOR (vim)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line

# Autojump functionality
eval "$(zoxide init zsh)"

# Plugins handled by zplug
source ~/.zplug/init.zsh

zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zplug "jeffreytse/zsh-vi-mode"

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load

# fix fzf binding which get overwritten by zsh-vi-mode
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# make control-D exit as in bash
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

eval $(thefuck --alias)
