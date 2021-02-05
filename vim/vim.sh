# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
brew install vim

# Vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlinks
rm -f ~/.vimrc
ln -s $dotfiles_dir/vim/.vimrc ~/.vimrc

# Neovim
brew instll neovim

# Symlinks for neovim
ln -s ~/dev/dotfiles/vim/.vimrc ~/.config/nvim/init.vim

# Vim plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
