cp .vimrc ~/.vimrc
echo "set vimrc"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
echo "set ZSH Powerline10k"
