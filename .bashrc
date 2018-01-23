echo 'From bashrc'

# used for setting up python virtualenvs
setup () {
    . ~/dev/envs/$1/bin/activate
}

# for testing mypy/typeshed changes
alias mypy_test='PYTHONPATH=~/os/mypy python3 -m mypy -f $@'

# git shortcuts
alias ga='git add --all'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff --cached'
alias glf='git diff-tree --no-commit-id --name-status -r'
alias gpf='git pull --ff-only'
alias gr='git remote -v'
alias gs='git status'

# custom shortcuts
alias vt='vim + `vita today`'

# setup custom gopath
export GOPATH=$HOME/os/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin

# adding psql/other postgres tools to path from Postgres.app install
export PATH=/Applications/Postgres.app/Contents/Versions/9.6/bin:$PATH


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
