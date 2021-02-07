#!/bin/bash

# Ask for the administrator password upfront
sudo -v

sh brew.sh

sh zsh/zsh.sh

read -r -p "Do you want to configure macOS? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  sh macos.sh
else
  echo "Skipping macOS configuration.";
fi

sh git/git.sh

sh tmux/tmux.sh

sh alacritty/alacritty.sh

sh vscode/vscode.sh

