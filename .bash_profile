if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi

# AUTOMATICALLY DONE BY PYTHON3.6 INSTALLER

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

eval "$(rbenv init -)"
