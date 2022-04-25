## circlefiles

This repository holds all of the files used for configuring unix utilities. You
can find vim configs, bash profile configuration, and more here. Setup symlinks
for each so that you can easily version control them. See below for more info:


### vim configuration

To setup the symlink for the repo, make sure to use the absolute paths like
as specified below. If you don't, you'll run into some weird situations where
the `.vimrc` can't be loaded.

```
$ ln -s ~/os/circlefiles/.vimrc ~/.vimrc
```

Once that is setup, follow the Vundle vim plugin manager instructions to
install and then run the plugin install: `:PluginInstall`

### bash configuration

This repo has both `.bashrc` and `.bash_profile` configurations, although all
`.bash_profile` does is source `.bashrc`. Again when symlinking this, be sure
to use absolute paths as specified below:

```
$ ln -s ~/os/circlefiles/.bashrc ~/.bashrc
$ ln -s ~/os/circlefiles/.bash_profile ~/.bash_profile
```

## ansible work

There are ansible playbooks for different servers, primarily the piper homebase
computer.

To run the playbook, here is a sample command:

```
# if you are running against local machine, as below, sudo is required
$ sudo ansible-playbook piper_home.yml 

# if running remotely, uses included hosts.ini file as below
$ sudo ansible-playbook -i hosts.ini zm_server.yml --ask-pass


# to test if your connection works, using ansible ping
$ ansible <host> -i hosts.ini -m ping --ask-pass
```

### macbook configuration

There is a special notebook: `mac_dev.yml` for configuring my local macbook
environment, inspired by the [Jeff Geerling version](https://github.com/geerlingguy/mac-dev-playbook).

For a new macbook configuration, follow these instructions:

1. Ensure xcode is installed ahead of time, using `xcode-select --install`.
2. Upgrade pip: `sudo pip3 install --upgrade pip`
3. Install ansible using pip3 with `pip3 install ansible`. You may find that `ansible` and
`ansible-galaxy` don't show up in your path after install. In my case on macOS 12.2.1 Monterey,
I had to manually add the default python install bin to my path with the following:
`export PATH=$PATH:~/Library/Python/3.8/bin`.
4. Download / clone this repo.

There are some pre-requisites to handle ahead of time:

1. Review the default variables in `mac_dev.config.yml` and make sure they are up-to-date.
2. Open `vars.yml` with `$ ansible-vault edit vars.yml` and enter the passphrase, and make sure 
those are correct as well. It's likely you will need to regenerate a new Github personal access
token that has `admin:public_key` and `admin:gpg_key` access as the existing one might be expired.
3. Handle your GPG key and transport it manually using an offline medium like an SD card or usb
stick. See below for details on how to do that.

```
# run on existing machine
$ cp -rp ~/.gnupg /Volumes/USBSTICK

# run on new machine
$ cp -r /Volumes/USBSTICK/.gnupg ~/.gnupg

# verify keys exist as expected
$ gpg --list-keys
```

To run the playbooks, we need to install imported Ansible roles and then run the actual playbook:
```
$ ansible-galaxy install -r requirements.yml 
$ ansible-playbook mac_dev.yml --ask-become-pass
```

### utility tasks

This repo also uses the invoke python library to store some automated tasks for
various things.

```
# list all tasks available
$ inv -l

# run raspberry pi zero setup
$ inv rasp-pi-zero-setup
```

### ubuntu server 18 notes

To get an Ubuntu Server 18.04 instance ready for Ansible, there is a bit of
manual configuration work. This section highlights the manual steps required.
The following steps assume you have a working sintallation of Ubuntu server
with sudo privileges and a wired Ethernet setup.

#### configuring ethernet access

Ubuntu 18 starts using a configuration tool called [Netplan](netplan) that is
well documented. I had to configure it manually using the following steps:

```
# get the ethernet interface name
$ ip a
```

Using the `sample_netplan_eth_dhcp.yml` config, edit the config file in
`/etc/netplan` to whatever specific use-case you need. Once it's been updated,
run `netplan apply` to restart your configuration and make sure you are
accessible from piper home.

#### configuring ssh server access

Installing the ssh server should start the server automatically and so far on
my Ubuntu Server installs, the port should be accessible. Using your user and
pw, you should be able to ssh in and be ready for whatever ansible playbook
you'd like.

```
$ sudo apt update
$ sudo apt install openssh-server

# from piper home, to verify server open and running
$ telnet <ip> 22
```

#### installing python for ansible

Ansible requires python2.7 to run, so that must be installed manually.

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo add-apt-repository ppa:deadsnakes/ppa
$ sudo apt install python python2.7
```


[netplan]: https://netplan.io/

