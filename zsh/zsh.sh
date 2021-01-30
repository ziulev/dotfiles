# dotfiles directory
dotfiles_dir=~/dev/dotfiles

# Install
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugin manager
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Install pure theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Symlinks
read -r -p "Do you want to overwrite zsh user config? [y|n] " configresponse
if [[ $configresponse =~ ^(y|yes|Y) ]];then
    rm ~/.zshrc
    ln -s $dotfiles_dir/zsh/.zshrc ~/.zshrc
else
    echo "Skipping user zsh config overwriting.";
fi
