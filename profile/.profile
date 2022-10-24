# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# for zsh symlinc .profile to .zprofile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set vim as default editor
export VISUAL=vi
export EDITOR="$VISUAL"

# source env variables 
if [ -f "$HOME/.env" ]; then
	. "$HOME/.env"
fi

# run commands in custom autostart script
if [ -f "$HOME/.config/autostart.sh" ]; then
	$HOME/.config/autostart.sh &
fi

