# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Python
brew install python

# NodeJS
brew install nodejs

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install vim
brew install vim --with-override-system-vi

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-iosevka

# Remove outdated versions from the cellar.
brew cleanup
