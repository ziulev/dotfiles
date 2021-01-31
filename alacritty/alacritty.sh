# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if brew list --cask alacritty >/dev/null 2>&1; then
  echo "Alacritty has been already installed, skipping installation"
else
  brew install --cask alacritty
fi

# Alacritty
read -r -p "Do you want to overwrite alacritty user config? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  mkdir -p "$HOME/.config"
  rm -f ~/.config/alacritty.yml
  ln -s $dotfiles_dir/alacritty/alacritty.yml ~/.config/alacritty.yml
else
  echo "Skipping alacritty user config overwriting.";
fi
