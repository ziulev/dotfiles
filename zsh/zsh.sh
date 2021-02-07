# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
if [[ -f "$HOME/.oh-my-zsh" ]]; then
  echo "oh-my-zsh has been already installed, skipping installation"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  chsh -s $(which zsh)
fi

# Install plugin manager
if [[ -f "$HOME/.zplug" ]]; then
  echo "zplug has been already installed, skipping installation"
else
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Install pure theme
if [[ -f "$HOME/.zsh/pure" ]]; then
  echo "zsh pure theme has been already installed, skipping installation"
else
  mkdir -p "$HOME/.zsh"
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

# Symlinks
rm ~/.zshrc
ln -s $dotfiles_dir/zsh/.zshrc ~/.zshrc

