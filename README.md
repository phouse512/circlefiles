### circlefiles

This repository holds all of the files used for configuring unix utilities. You
can find vim configs, bash profile configuration, and more here. Setup symlinks
for each so that you can easily version control them. See below for more info:


#### vim configuration

To setup the symlink for the repo, make sure to use the absolute paths like
as specified below. If you don't, you'll run into some weird situations where
the `.vimrc` can't be loaded.

```
$ ln -s ~/os/circlefiles/.vimrc ~/.vimrc
```

Once that is setup, follow the Vundle vim plugin manager instructions to
install and then run the plugin install: `:PluginInstall`

#### bash configuration

This repo has both `.bashrc` and `.bash_profile` configurations, although all
`.bash_profile` does is source `.bashrc`. Again when symlinking this, be sure
to use absolute paths as specified below:

```
$ ln -s ~/os/circlefiles/.bashrc ~/.bashrc
$ ln -s ~/os/circlefiles/.bash_profile ~/.bash_profile
```

#### ansible work

There are ansible playbooks for different servers, primarily the piper homebase
computer.

To run the playbook, here is a sample command:

```
# if you are running against local machine, as below, sudo is required
$ sudo ansible-playbook piper_home.yml 
```

#### utility tasks

This repo also uses the invoke python library to store some automated tasks for
various things.

```
# list all tasks available
$ inv -l

# run raspberry pi zero setup
$ inv rasp-pi-zero-setup
```

