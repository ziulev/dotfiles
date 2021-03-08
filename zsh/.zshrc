ZSH_DISABLE_COMPFIX=true

export DOTFILES=$HOME/dev/dotfiles

export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.npm-packages/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export DISABLE_AUTO_TITLE='true'

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

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

PATH="/usr/local/bin:$PATH"

export TERM="xterm-256color"

# --------------------------------------------------------------------------------------------------
# Aliases
# --------------------------------------------------------------------------------------------------
alias c="clear"
alias rmd="rm -rf node_modules"
alias gpl="git pull --rebase"
alias p="npm publish"
alias i="npm i"
alias s="clear && npm start"
alias is="npm i && npm start"



function loadTmuxSession() {
  if [[ -f "$DOTFILES/tmux/session.local.yml" ]]; then
    tmuxp load $DOTFILES/tmux/session.local.yml
  else
    tmuxp load $DOTFILES/tmux/session.yml
  fi
}

alias t="tmux attach || loadTmuxSession"


alias rm="rm -i"

# alias commit="git-smart-commit"
# alias pull="git-smart-pull"
# alias push="git-smart-push seletskiy"

alias vim="nvim"
alias v="nvim"

alias oni2='/Applications/Onivim2.app/Contents/MacOS/Oni2'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g;'

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

alias pip=pip3

alias g=lazygit

# --------------------------------------------------------------------------------------------------
# Functions
# --------------------------------------------------------------------------------------------------
# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

export UPDATE_ZSH_DAYS=1

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------------------------------
# Plugins
# --------------------------------------------------------------------------------------------------
if [ -f ${HOME}/.zplug/init.zsh ]; then

  source ${HOME}/.zplug/init.zsh
  zplug "chrissicool/zsh-256color" 

  zplug "zsh-users/zsh-completions",              defer:0
  zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
  zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

  zplug "djui/alias-tips"
  zplug "${HOME}/.zsh/", from:local, use:"mn.zsh-theme", defer:2

  # Install plugins if there are plugins that have not been installed
  if ! zplug check; then
    zplug install
  fi

  # Load everything
  zplug load
fi

# THEME
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure


###-tns-completion-start-###
if [ -f /Users/denis/.tnsrc ]; then 
    source /Users/denis/.tnsrc 
fi
###-tns-completion-end-###

# Autorun tmux
# if [ -z "$TMUX" ]
# then
# tmux attach -t TMUX || tmux new -s TMUX
# fi

bindkey -v

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# FZF Moving by ctrl + n
# bindkey '^[[A' history-beginning-search-backward
# bindkey '^[[B' history-beginning-search-forward

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

check_dotfiles_updates() {
  changed=0
  echo "Checking dotfiles changes...";
  cd $DOTFILES && git fetch && git status -uno | grep -q 'Your branch is behind' && changed=1
  if [ $changed = 1 ]; then
    git pull
    echo "Dotfiles updated successfully";
  else
    echo "Dotfiles up-to-date"
  fi
  cd ~
}

# Check dotfiles updates
if [ -z "$TMUX" ]
then
  check_dotfiles_updates
  # t
fi

export HOMEBREW_GITHUB_API_TOKEN=13c84bc0adbc5fe4181314a95c8e62efc1fae2b0
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit
