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
