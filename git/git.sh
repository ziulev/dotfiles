# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if brew --version >/dev/null 2>&1; then
  echo "Git has been already installed, skipping installation"
else
  brew install git
fi

# Symlinks
rm -f ~/.gitconfig
ln -s $dotfiles_dir/git/.gitconfig ~/.gitconfig

