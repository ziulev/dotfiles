# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
# if nvim -V >/dev/null 2>&1; then
#   echo "neovim has been already installed, skipping installation"
# else
#   brew install neovim
# fi
brew install vim
brew link vim

# Vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symlinks
rm -f ~/.vimrc
ln -s $dotfiles_dir/vim/.vimrc ~/.vimrc
