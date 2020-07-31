# stop macOS from creating DS_Store files everywhere
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# create a .vimrc file from my config
ln -sf ~/repos/config/.vimrc ~
echo "linked vimrc"

# create a .zshrc file with my config... 
ln -sf ~/repos/config/.zshrc ~
echo "linked zsrhc"

# create aliases file that can be shared by zsh and bash
ln -sf ~/repos/config/.aliases ~
echo "linked aliases"

# plugins
ln -sf ~/repos/config/.zsh ~

# my custom p10k config
ln -sf ~/repos/config/.p10k.zsh ~

# reload zsh
zsh
