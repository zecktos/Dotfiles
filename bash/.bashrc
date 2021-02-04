# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash-completion with sudo
complete -cf sudo

# vi edit mode
# set -o vi

# more bash settings
bind "set completion-ignore-case on"
bind "set completion-map-case on"

shopt -s autocd
shopt -s dirspell
shopt -s cdspell

alias ls='ls --color=auto'
alias la='ls -a'

mkdircd() {
	# make directory and cd into it
	mkdir -p "$@" && cd "$@"
}

ssh_host() {
	# show hostname when logged in over ssh
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
	then
		echo "\[\033[0;35m\] \h\[\033[0m\]:"
	else
		echo ""
	fi
}

git_branch() {
	# show git branch
	branch=$( git branch 2>/dev/null | grep '^*' | colrm 1 2 )
	if [ -n "$branch" ]
	then
		echo "[$branch] "
	else
		echo ""
	fi
}

PS1=$(ssh_host)'\[\033[1;33m\] \W \[\033[0;33m\]$(git_branch)\[\033[1;36m\]>\[\033[1;32m\]>\[\033[1;33m\]> \[\033[0m\]'
