# import aliases
source $HOME/.aliases

# automatic directory switching (zsh feature)
setopt autocd

# for rbenv (install via homebrew)
eval "$(rbenv init -)"
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
