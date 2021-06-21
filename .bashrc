set -o vi
export EDITOR=vim

eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/z.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
