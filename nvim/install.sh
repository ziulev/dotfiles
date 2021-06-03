#!/bin/bash

# dotfiles directory
DOTFILES=~/Developer/dotfiles
MODULE="NVIM"

# Install
if command nvim --version >/dev/null 2>&1; then
  echo "[ SKIPPING ] :: $MODULE >> Neovim has been already installed"
else
  echo "[ INSTALLING ] :: $MODULE >> Neovim"
  brew install neovim
fi

if command efm-langserver -v >/dev/null 2>&1; then
  echo "[ SKIPPING ] :: $MODULE >> efm-langserver has been already installed"
else
  echo "[ INSTALLING ] :: $MODULE >> efm-langserver"
  brew install efm-langserver
fi

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	echo "[ SKIPPING ] :: $MODULE >> packer already installed"
else
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi


if [ -e "$HOME/.config/nvim/init.vim" ]; then
	echo "[ SKIPPING ] :: $MODULE >> Config already installed"
else
  echo "[ LINKING ] :: $MODULE >> lua folder"
  ln -sf "$DOTFILES/nvim/lua" $HOME/.config/nvim/lua

  echo "[ LINKING ] :: $MODULE >> init.vim"
  ln -sf "$DOTFILES/nvim/init.vim" $HOME/.config/nvim/init.vim
fi

# echo "[ LINKING ] :: $MODULE >> init.lua"
# ln -sf "$DOTFILES/nvim/init.lua" $HOME/.config/nvim/init.lua





# rm -f ~/.config/nvim/lua
# ln -s ~/Developer/dotfiles/vim/lua ~/.config/nvim/lua

# Symlinks for coc-settings
# rm -f ~/.config/nvim/coc-settings.json
# ln -s $dotfiles_dir/vim/coc-settings.json ~/.config/nvim/coc-settings.json

