# Installation

 ```
 git clone git@github.com:jet8a/dotfiles.git
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
