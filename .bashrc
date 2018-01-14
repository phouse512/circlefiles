echo 'From bashrc'

# used for setting up python virtualenvs
setup () {
    . ~/dev/envs/$1/bin/activate
}

# for testing mypy/typeshed changes
alias mypy_test='PYTHONPATH=~/os/mypy python3 -m mypy -f $@'

# git shortcuts
alias gb='git branch'
alias gc='git commit'
alias gd='git diff --cached'
alias glf='git diff-tree --no-commit-id --name-status -r'
alias gpf='git pull --ff-only'
alias gr='git remote -v'
alias gs='git status'

