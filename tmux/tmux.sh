# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if tmux -V >/dev/null 2>&1; then
  echo "tmux has been already installed, skipping installation"
else
  brew install tmux
fi

# Sessions
if tmuxp -V >/dev/null 2>&1; then
  echo "tmux has been already installed, skipping installation"
else
  pip3 install --user tmuxp
fi

# Symlinks
rm -f ~/.tmux.conf
ln -s $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf
