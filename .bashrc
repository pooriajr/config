# import aliases
source ~/.aliases

eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

source ~/z.sh

