# dotfiles directory
dotfiles_dir=~/Developer/dotfiles

# Install
if brew list --cask alacritty >/Developer/null 2>&1; then
  echo "Alacritty has been already installed, skipping installation"
else
  brew install --cask alacritty
fi

# Alacritty
mkdir -p "$HOME/.config"
rm -f ~/.config/alacritty.yml
ln -s $dotfiles_dir/alacritty/alacritty.yml ~/.config/alacritty.yml

