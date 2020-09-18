# Installation

 ```
 git clone git@github.com:jet8a/dotfiles.git .dotfiles
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
 
 ```
 ln -s ~/.dotiles/.zshrc ~/.zshrc
 ```

 # Link VSCode
 ```
 ln -s ~/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
 ```

 ```
 ln -s ~/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
 ```

 ```
 ln -s ~/VSCode/snippets/ ~/Library/Application\ Support/Code/User
 ```

 # Set global hooks path
 ```
 git config --global core.hooksPath ~/.git-templates/hooks
 ```

