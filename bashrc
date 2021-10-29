# Don't source this file in non-interactive shells.
if [[ $- != *i* ]] ; then
	return
fi

# This presumes my uid == gid, i.e., username == groupname.
umask 0007

# Aliases are stored in a separate file.
source ~/.local/config/bash/aliases

# Bash enhancements.
shopt -s autocd # cd without typing cd
shopt -s cdspell # fix simple spelling mistakes when using cd
shopt -s cmdhist # multi-line commands are a single entry in history
shopt -s globstar # ** matches all files and directories
shopt -s histappend # append to HISTFILE don't overwrite

# Environment variables.
EDITOR=vim
HISTCONTROL=ignoredups:ignorespace
HISTFILESIZE=infinite
HISTSIZE=infinite
HISTTIMEFORMAT="%F %T"
XDG_DATA_HOME=$HOME/.local/share # see [1]
XDG_CONFIG_HOME=$HOME/.local/config
XDG_STATE_HOME=$HOME/.local/state
PATH=$HOME/binary:${PATH}

PASSWORD_STORE_DIR=$HOME/.local/config/pass

# Configure the (two-line) prompt with $PWD listed above prompt.
c_reset="$(tput sgr0)"
c_blue="$(tput setaf 4)"
c_green="$(tput setaf 2)"
PS1="\w\n\[$c_green\]\A \h \u \!\[$c_reset\] \$ "

# Links
# [1]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
