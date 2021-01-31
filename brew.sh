# Homebrew
if brew -v >/dev/null 2>&1; then
  echo "Homebrew has been already installed, skipping installation"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Python
if python -V >/dev/null 2>&1; then
  echo "Python has been already installed, skipping installation"
else
  brew install python
fi

# Node
if node -v >/dev/null 2>&1; then
  echo "Node has been already installed, skipping installation"
else
  brew install nodejs
fi

# Fonts
if brew list --cask font-iosevka >/dev/null 2>&1; then
  echo "Font iosevka has been already installed, skipping installation"
else
  brew tap homebrew/cask-fonts
  brew install --cask font-iosevka
fi

# Spotter
if brew list --cask spotter >/dev/null 2>&1; then
  echo "Spotter has been already installed, skipping installation"
else
  brew install --cask spotter
  osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/spotter.app", hidden:false}'
fi
