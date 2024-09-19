# Don't source this file in non-interactive shells.
if [[ $- != *i* ]] ; then
	return
fi

# This presumes my uid == gid, i.e., username == groupname.
umask 0027

# Environment variables.
EDITOR=vim
HISTCONTROL=ignoreboth
HISTFILESIZE=infinite
HISTSIZE=infinite
HISTTIMEFORMAT="%F %T "
PATH=$HOME/binary:${PATH}
PASSWORD_STORE_DIR=$HOME/.local/config/pass

# Aliases are stored in a separate file.
source ~/.local/config/bash/aliases

# Bash enhancements.
shopt -s autocd # cd without typing cd
shopt -s cdspell # fix simple spelling mistakes when using cd
shopt -s cmdhist # multi-line commands are a single entry in history
shopt -s globstar # ** matches all files and directories
shopt -s histappend # append to HISTFILE don't overwrite

# Configure the (two-line) prompt with $PWD listed above prompt.
c_reset="$(tput sgr0)"
c_blue="$(tput setaf 4)"
c_green="$(tput setaf 2)"
PS1="\w\n\[$c_green\]\A \h \u \!\[$c_reset\] \$ "

source /usr/share/bash-completion/completions/fzf
source /usr/share/fzf/key-bindings.bash

# Coloured `ls`.
export dircolors

# Don't require me to exit the pager if there is enough room.
export LESS="$LESS -FX"

# Save the SSH agent so we don't have to constantly type key passwords.
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# Links
# [1]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
