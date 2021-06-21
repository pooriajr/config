# Posix stuff that isn't zsh specific
source $HOME/.profile

ENABLE_CORRECTION="true"

export BAT_THEME="Nord"

# Prompt
autoload -U promptinit; promptinit
prompt pure

# Autojump functionality
eval "$(zoxide init zsh)"

# Plugins handled by zplug
source ~/.zplug/init.zsh

zplug "plugins/git",   from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
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
