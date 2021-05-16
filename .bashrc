set -o vi
export EDITOR=vim

eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='rg --files'

source ~/z.sh

export PATH="$PATH:/Users/kian/Library/Python/3.9/bin:~/bin"

# Prompt
# --------------------------------------------------------------------
__git_ps1() { :;}
if [ -e ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'

# Aliases
alias g='git'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gs='git status'
alias gp='git push'

alias ..='cd ..'

alias be='bundle exec'

alias mvi="/Applications/MacVim.app/Contents/bin/mvim" #open in MacVim
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BASH_SILENCE_DEPRECATION_WARNING=1
