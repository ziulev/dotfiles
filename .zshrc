# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export DEFAULT_USER="$(whoami)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export ANDROID_HOME=/Users/denis/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/denis/Library/Android/sdk
export ANDROID_AVD_HOME=/Users/denis/.android/avd

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

alias c="clear"
alias rmodules="rm -rf node_modules"
alias gpl="git pull --rebase"
alias p="npm publish"
alias i="npm i"
alias s="clear && npm start"
alias is="npm i && npm start"
alias ps="npm publish && npm start"
alias b="npm run build"
alias ib="npm i && npm run build"

# RUST
alias cr="cargo run"

alias commit="git-smart-commit"
alias pull="git-smart-pull"
alias push="git-smart-push seletskiy"

alias vim="nvim"
alias vi="nvim"

alias oni2='/Applications/Onivim2.app/Contents/MacOS/Oni2'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g;'

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

plugins=(
  git
  zsh-autosuggestions
  autojump
  git-flow
  alias-tips
  z
  autoupdate
)

export UPDATE_ZSH_DAYS=1

source $HOME/.cargo/env

source $ZSH/oh-my-zsh.sh
### Added by Zplugin's installer
source '/Users/denis/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

source ~/.zplug/init.zsh

zplug "chrissicool/zsh-256color" 
zplug "zsh-users/zsh-autosuggestions" 
zplug "djui/alias-tips"
zplug "smallhadroncollider/antigen-git-rebase"
zplug load "seletskiy/zsh-git-smart-commands"

PATH="/usr/local/bin:$PATH"

# THEME
autoload -U promptinit; promptinit
prompt pure


# include Z, yo
# . ~/z.sh

###-tns-completion-start-###
if [ -f /Users/denis/.tnsrc ]; then 
    source /Users/denis/.tnsrc 
fi
###-tns-completion-end-###

# Autorun tmux
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

bindkey -v
