# import aliases
source ~/.aliases

# automatic directory switching (zsh feature)
setopt autocd

# require by rbenv 
eval "$(rbenv init -)"

# Plugins
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh

# My custom p10k config
source ~/.p10k.zsh

