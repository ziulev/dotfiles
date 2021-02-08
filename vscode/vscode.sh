# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if code >/dev/null; then
  echo "Visual Studio Code has been already installed, skipping installation"
else
  brew install --cask visual-studio-code
fi

# Open to generate settings.json
code .
sleep 3
osascript -e 'quit app "Visual Studio Code"'

# Symlinks, Extensions
code -v > /dev/null
if [[ $? -eq 0 ]];then
  echo "Setting VSC symlinks..."
  rm -f ~/Library/Application\ Support/Code/User/settings.json
  ln -s $dotfiles_dir/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

  rm -f ~/Library/Application\ Support/Code/User/keybindings.json
  ln -s $dotfiles_dir/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

  # ln -s $dotfiles_dir/vscode/snippets/ ~/Library/Application\ Support/Code/User

  echo "Installing VSC extensions..."
  code --install-extension will-stone.plastic
  code --install-extension christian-kohler.npm-intellisense
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension EmberTooling.vscode-ember
  code --install-extension streetsidesoftware.code-spell-checker
  code --install-extension EditorConfig.EditorConfig
  code --install-extension eamodio.gitlens
  code --install-extension vscodevim.vim
  echo "Extensions for VSC have been installed"

else
  echo "It looks like the command 'code' isn't accessible."
  echo "Please make sure you have Visual Studio Code installed"
fi

# Enable VSCodeVim Key Repeat
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

