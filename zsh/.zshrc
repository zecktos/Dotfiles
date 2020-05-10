# .zshrc

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd extendedglob nomatch notify
setopt PROMPT_SUBST
setopt correctall
setopt hist_ignore_all_dups
setopt hist_ignore_space
unsetopt beep

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b' 
# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'

bindkey -v
bindkey '^R' history-incremental-search-backward

# some shortcuts
alias ls='ls --color=auto'
alias la='ls -a'

alias processing-run='processing-java --sketch=$PWD  --run'

alias blank='xset dpms force off'

alias todo-ed='vim .todo.txt'

mkdircd() {
	# make directory and cd into it
	mkdir -p "$@" && cd "$@"
}

ssh_host() {
	# show hostname when logged in over ssh
	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
	then
		echo "%F{magenta} %m%F{white}:"
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

PS1=$(ssh_host)'%B%F{yellow} %1~ %b$(git_branch)%B%F{blue}>%F{green}>%F{yellow}>%b%F{white} '
