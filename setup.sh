# link dotfiles
ln -sf ~/repos/config/.vimrc ~
echo "linked vimrc"

ln -sf ~/repos/config/.bashrc ~
echo "linked bashrc"

ln -sf ~/repos/config/.aliases ~
echo "linked aliases"

ln -sf ~/repos/config/.gitconfig ~
echo "linked .gitconfig"

# z
ln -sf ~/repos/config/z.sh ~

# reload bash
bash
