# stop macOS from creating DS_Store files everywhere
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# create a .vimrc file from my config
cp .vimrc ~
echo "set vimrc"

# create a .zshrc file with my config... 
cp .zshrc ~
echo "set zsrhc"

# create aliases file that can be shared by zsh and bash
cp .aliases ~
echo "set aliases"

# then clone and append powerlevel10k to it
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
# with my custom p10k config
cp .p10k.zsh ~
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

# reload zsh
zsh
