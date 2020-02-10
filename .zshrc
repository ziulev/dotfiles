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
alias s="npm start"
alias is="npm i && npm start"
alias ps="npm publish && npm start"
alias b="npm run build"
alias ib="npm i && npm run build"

alias commit="git-smart-commit"
alias pull="git-smart-pull"
alias push="git-smart-push seletskiy"

alias vim="nvim"
alias vi="nvim"

alias oni2='/Applications/Onivim2.app/Contents/MacOS/Oni2'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
