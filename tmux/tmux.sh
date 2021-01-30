# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
brew install tmux

# Sessions
pip3 install --user tmuxp

# Symlinks
read -r -p "Do you want to overwrite tmux user config? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  rm -f ~/.tmux.conf
  ln -s $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf
else
  echo "Skipping tmux user config overwriting.";
fi
