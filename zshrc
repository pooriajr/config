# Posix stuff that isn't zsh specific
source $HOME/.profile

export EDITOR=nvim

ENABLE_CORRECTION="true"
setopt auto_cd

export BAT_THEME="Nord"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# NVM (all this fancy stuff is to make it load faster)
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# Autojump functionality
eval "$(zoxide init zsh)"

# make control-D exit as in bash
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

eval $(thefuck --alias)
