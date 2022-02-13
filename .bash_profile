if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

# AUTOMATICALLY DONE BY PYTHON3.6 INSTALLER

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/philiphouse/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/philiphouse/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/philiphouse/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/philiphouse/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
