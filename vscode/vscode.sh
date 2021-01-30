# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
brew install --cask visual-studio-code

# Symlinks
read -r -p "Do you want to overwrite vscode user config? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
  rm -f ~/Library/Application\ Support/Code/User/settings.json
  ln -s $dotfiles_dir/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

  rm -f ~/Library/Application\ Support/Code/User/keybindings.json
  ln -s $dotfiles_dir/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

  # ln -s $dotfiles_dir/vscode/snippets/ ~/Library/Application\ Support/Code/User
else
  echo "Skipping vscode user config overwriting.";
fi

# Extensions
code -v > /dev/null
if [[ $? -eq 0 ]];then
  read -r -p "Do you want to install VSC extensions? [y|n] " configresponse
  if [[ $configresponse =~ ^(y|yes|Y) ]];then
    echo "Installing extensions please wait..."
    code --install-extension will-stone.plastic
    code --install-extension christian-kohler.npm-intellisense
    code --install-extension dbaeumer.vscode-eslint
    code --install-extension EmberTooling.vscode-ember
    code --install-extension streetsidesoftware.code-spell-checker
    code --install-extension EditorConfig.EditorConfig


    echo "Extensions for VSC have been installed"
  else
    echo "Skipping extension install.";
  fi

else
  echo "It looks like the command 'code' isn't accessible."
  echo "Please make sure you have Visual Studio Code installed"
  echo "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi
