export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

autoload -Uz colors
colors

autoload -U compinit
compinit

# aliases
alias ls='ls -F -a'
alias ll='ls -l'

alias g=git
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gs='git status'
alias gb='git branch -a'
alias gd='git diff'
alias gdw='git diff --ignore-all-space'
alias gdc='git diff --cached'
alias gdcw='git diff --cached --ignore-all-space'
alias grb='git rebase'
alias gf='git fetch'
alias gl='git l'

alias v=vagrant
alias e=emacs
alias bx='bundle exec'

function agp() {
    ag $1 | peco
}

bindkey -e

setopt print_eight_bit

setopt no_beep

# history
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt share_history

# pushd
setopt auto_pushd
setopt pushd_ignore_dups

########################################


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.cask/bin:$PATH"


npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir


# set current directory name to iterm2 tab name
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print ""$1"/"}'| rev)\007"}

# load under ~/.zsh/
ZSHHOME="${HOME}/.zsh"
if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.sh ]] &&
        [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/shims:$PATH"

export GOPATH=$HOME/workspace
export PATH=$PATH:$GOPATH/bin

bindkey '^]' peco-src
function peco-src() {
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c }
zle -N peco-src
