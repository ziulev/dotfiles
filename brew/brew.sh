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

if brew list --cask font-iosevka-nerd-font >/dev/null 2>&1; then
  echo "Iosevka nerd font has been already installed, skipping installation"
else
  brew tap homebrew/cask-fonts
  brew install --cask font-iosevka-nerd-font
fi

# Fzf
if brew list fzf >/dev/null 2>&1; then
  echo "Fzf has been already installed, skipping installation"
else
  brew install fzf
fi

# Ripgrep (need for fzf vim plugin)
if brew list ripgrep >/dev/null 2>&1; then
  echo "Ripgrep  has been already installed, skipping installation"
else
  brew install ripgrep
fi

# Spotter
if brew list --cask spotter >/dev/null 2>&1; then
  echo "Spotter has been already installed, skipping installation"
else
  brew install --cask spotter
  osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/spotter.app", hidden:false}'
fi

# Telegram
if brew list --cask telegram >/dev/null 2>&1; then
  echo "Telegram has been already installed, skipping installation"
else
  brew install --cask telegram
fi

# Bitwarden
if brew list --cask bitwarden >/dev/null 2>&1; then
  echo "Bitwarden has been already installed, skipping installation"
else
  brew install --cask bitwarden
fi

# Karabiner
# if brew list --cask karabiner-elements >/dev/null 2>&1; then
#   echo "Karabiner has been already installed, skipping installation"
# else
#   brew install --cask karabiner-elements
# fi

# Mailtrackerblocker
if brew list --cask mailtrackerblocker >/dev/null 2>&1; then
  echo "Mailtrackerblocker has been already installed, skipping installation"
else
  brew install apparition47/tap/mailtrackerblocker
fi


if brew list --cask eul >/dev/null 2>&1; then
  echo "Eul has been already installed, skipping installation"
else
  brew install --cask eul
fi

