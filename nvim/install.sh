#!/bin/bash

# dotfiles directory
DOTFILES=~/dev/dotfiles
MODULE="NVIM"

# Install
if command -v nvim >/dev/null 2>&1; then
  echo "[ SKIPPING ] :: $MODULE >> Neovim has been already installed"
else
  echo "[ INSTALLING ] :: $MODULE >> Neovim"
  brew install neovim
fi

if command -v shellcheck >/dev/null 2>&1; then
  echo "[ SKIPPING ] :: $MODULE >> shellcheck has been already installed"
else
  echo "[ INSTALLING ] :: $MODULE >> shellcheck"
  brew install shellcheck
fi

if command -v efm-langserver >/dev/null 2>&1; then
  echo "[ SKIPPING ] :: $MODULE >> efm-langserver has been already installed"
else
  echo "[ INSTALLING ] :: $MODULE >> efm-langserver"
  brew install efm-langserver
fi

# Packer and symlinks
if command -v nvim >/dev/null 2>&1; then
  PACKER=$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

  if [ ! -f $PACKER ]; then
    echo "[ INSTALLING ] :: $MODULE >> packer.nvim"

    git clone https://github.com/wbthomason/packer.nvim $PACKER

    mkdir -p $HOME/.config/nvim/

    echo "[ LINKING ] :: $MODULE >> init.lua"
    ln -sf "$DOTFILES/nvim/init.lua" $HOME/.config/nvim/init.lua

    # echo "[ LINKING ] :: $MODULE >> lua folder"
    # ln -sf "$DOTFILES/nvim/lua" $HOME/.config/nvim/lua
    echo "[ LINKING ] :: $MODULE >> init.vim"
    ln -sf "$DOTFILES/nvim/init.vim" $HOME/.config/nvim/init.vim

    echo "[ INSTALLING ] :: $MODULE >> Plugins"
    nvim --headless +PackerCompile +PackerInstall +qa
  else
    echo "[ UPDATING ] :: $MODULE >> Plugins"
    nvim --headless +PackerUpdate +qa
  fi
else
  echo "[ ERROR ] :: Please install `neovim`"
fi



# rm -f ~/.config/nvim/lua
# ln -s ~/dev/dotfiles/vim/lua ~/.config/nvim/lua

# Symlinks for coc-settings
# rm -f ~/.config/nvim/coc-settings.json
# ln -s $dotfiles_dir/vim/coc-settings.json ~/.config/nvim/coc-settings.json

