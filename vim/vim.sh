# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if brew list vim >/dev/null 2>&1; then
  echo "Vim has been already installed, skipping installation"
else
  brew install vim

  # Vim plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Symlinks
rm -f ~/.vimrc
ln -s $dotfiles_dir/vim/.vimrc ~/.vimrc

# Neovim
if brew list neovim >/dev/null 2>&1; then
  echo "Neovim has been already installed, skipping installation"
else
  brew instll neovim

  # Vim plug for neovim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Symlinks for neovim
ln -s ~/dev/dotfiles/vim/.vimrc ~/.config/nvim/init.vim

