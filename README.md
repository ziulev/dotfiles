# Installation

 ```
 git clone git@github.com:jet8a/dotfiles.git ~/dev/dotfiles
 ```

 ```
 alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
 ```

 ```
 dotfiles checkout
 ```

 Prevent untracked files from showing up on dotfiles status.
 ```
 dotfiles config --local status.showUntrackedFiles no
 ```
 
 ## ZSH
 
 ```
 ln -s ~/dev/dotfiles/.zshrc ~/.zshrc
 ```
 
 ## Alacritty
 ```
 ln -s ~/dev/dotfiles/alacritty.yml ~/.config/alacritty.yml
 ```

 ## VSCode
 ```
 ln -s ~/dev/dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
 ```

 ```
 ln -s ~/dev/dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
 ```

 ```
 ln -s ~/dev/dotfiles/.vscode/snippets/ ~/Library/Application\ Support/Code/User
 ```

