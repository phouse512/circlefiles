echo 'From bashrc'

# adding colors
Color_Off='\033[0m'       # Text Reset

Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# used for setting up python virtualenvs
setup () {
    . ~/dev/envs/$1/bin/activate
}

vt () {
    if [ $# -eq 0 ]; then
        vim + `vita today`
    else
        vim + `vita today $1`
    fi
}

function virtualenv_info() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

FILE="/Users/PhilipHouse/.amperrc"
if [ -f $FILE ]; then
    echo ".amperrc found."
    source ~/.amperrc
else
    echo "The file '$FILE' is not found."
fi

# for testing mypy/typeshed changes
alias mypy_test='PYTHONPATH=~/os/mypy python3 -m mypy -f $@'

# opening pycharm
alias pycharm='open -a /Applications/PyCharm*.app'

# git shortcuts
alias ga='git add --all'
alias gb='git branch'
alias gbd="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
alias gc='git commit -S'
alias gco='git checkout'
alias gd='git diff --cached'
alias gl='git log --show-signature'
alias glf='git diff-tree --no-commit-id --name-status -r'
alias gpf='git pull --ff-only'
alias gr='git remote -v'
alias gs='git status'
alias gsh='git rev-parse --short HEAD'
alias gdeletemerged="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"

export GPG_TTY=$(tty)

# alias starting jupyter
alias js='jupyter notebook --NotebookApp.iopub_data_rate_limit=10000000000'

# alias ultralist task manager
alias ul='ultralist'
# alias incomplete amper work items
alias ula='ultralist l completed:false group:p project:-personal,-piper'

# alias incomplete amper work items, due today
alias ulat='ula duebefore:tom'

# list personal agenda
alias ulp='ultralist l completed:false group:p project:personal,piper'

# setup custom gopath
export GOPATH=$HOME/os/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin

# adding psql/other postgres tools to path from Postgres.app install
export PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH

# add CMake to build path
export PATH=/Applications/CMake.app/Contents/bin:$PATH



# disable virtualenv defeault prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# update prompt to custom format
VENV="\$(virtualenv_info)";
export PS1="\[${BRed}\]${VENV}\[${Color_Off}\][\[${BGreen}\]\u@\h\[${Color_Off}\]:\[${BBlack}\]\D{%F %T}\[${Color_Off}\]:\[${BBlue}\]\W\[${Color_Off}\]] "

### AUTO SET BY NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### AUTO SET BY SERVERLESS
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/philiphouse/.nvm/versions/node/v6.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/philiphouse/.nvm/versions/node/v6.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/philiphouse/.nvm/versions/node/v6.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/philiphouse/.nvm/versions/node/v6.7.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/philiphouse/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/philiphouse/.nvm/versions/node/v8.9.4/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
