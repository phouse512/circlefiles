echo 'From bashrc'

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

# setup custom gopath
export GOPATH=$HOME/os/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin

# adding psql/other postgres tools to path from Postgres.app install
export PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH

# adding java home to path
JAVA_FILE="/usr/libexec/java_home"
if [ -f $JAVA_FILE ]; then
    echo "java_home found."
    export JAVA_HOME=$(/usr/libexec/java_home)
else
    echo "/usr/libexec/java_home not found, not exporting."
fi

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
