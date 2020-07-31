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

# then clone and append powerlevel10k to it
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
# with my custom p10k config
ln -sf ~/repos/config/.p10k.zsh ~
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# reload zsh
zsh
