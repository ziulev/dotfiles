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
  echo "TEST211111111111"
  pip3 install --user tmuxp
fi

# Symlinks
read -r -p "Do you want to overwrite tmux user config? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  rm -f ~/.tmux.conf
  ln -s $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf
else
  echo "Skipping tmux user config overwriting.";
fi
