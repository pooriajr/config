# link dotfiles
ln -sf ~/repos/config/.vimrc ~
echo "linked vimrc"

ln -sf ~/repos/config/.bashrc ~
echo "linked bashrc"

ln -sf ~/repos/config/.gitconfig ~
echo "linked .gitconfig"

# z
ln -sf ~/repos/config/z.sh ~

# git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# reload bash
bash
