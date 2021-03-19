#!/bin/bash

# Ask for the administrator password upfront
sudo -v

sh brew/brew.sh

sh zsh/zsh.sh

read -r -p "Do you want to configure macOS? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  sh macos/macos.sh
else
  echo "Skipping macOS configuration.";
fi

sh nvim/install.sh

sh git/git.sh

sh tmux/tmux.sh

sh alacritty/alacritty.sh

sh vscode/vscode.sh

