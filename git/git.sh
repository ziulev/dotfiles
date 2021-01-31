# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if brew --version >/dev/null 2>&1; then
  echo "Git has been already installed, skipping installation"
else
  brew install git
fi

# Symlinks
read -r -p "Do you want to overwrite git user config? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  rm -f ~/.gitconfig
  ln -s $dotfiles_dir/git/.gitconfig ~/.gitconfig
else
  echo "Skipping git user config overwriting.";
fi
