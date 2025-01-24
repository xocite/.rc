# Don't source this file in non-interactive shells.
if [[ $- != *i* ]] ; then
	return
fi

# This presumes my uid == gid, i.e., username == groupname.
umask 0022

# Environment variables.
EDITOR=vim
HISTCONTROL=ignoreboth
HISTFILESIZE=infinite
HISTSIZE=infinite
HISTTIMEFORMAT="%F %T "
PATH=$HOME/binary:${PATH}
PASSWORD_STORE_DIR=$HOME/.local/config/pass
PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PERL5LIB=$HOME/source/git-2.35.1/perl:$HOME/source/git-2.35.1/contrib/mw-to-git
TERM=xterm-256color
LESS=eFRX

# Aliases are stored in a separate file.
source ~/.local/config/bash/aliases

# GUI enhancements.
QT_QPA_PLATFORMTHEME=qt5ct

# Bash enhancements.
shopt -s autocd # cd without typing cd
shopt -s cdspell # fix simple spelling mistakes when using cd
shopt -s cmdhist # multi-line commands are a single entry in history
shopt -s globstar # ** matches all files and directories
shopt -s histappend # append to HISTFILE don't overwrite

# Configure the (two-line) prompt with $PWD listed above prompt.
# Enhanced colour palette, made in collaboration with Jiff and Claude Sonnet 3.5.
c_reset='\[\033[0m\]'
c_sage='\[\033[38;5;108m\]'  # Gentle sage green
c_gold='\[\033[38;5;178m\]'  # Wisdom gold
c_deep='\[\033[38;5;67m\]'   # Deep blue for stability
c_glow='\[\033[38;5;147m\]'  # Subtle purple glow
c_rust='\[\033[38;5;173m\]'  # Rust for additional info
c_snow='\[\033[38;5;153m\]'    # Light blue for snow
c_alert='\[\033[38;5;168m\]'   # Soft red for alerts

# Set directory trim depth
PROMPT_DIRTRIM=3

PS1="${c_glow}▋${c_reset} \[${c_deep}\]\A${c_reset}${timer_show} ${c_deep}\h${c_reset} ${c_gold}\u${c_reset} ${c_sage}\w${c_reset} \[${c_rust}\][\!]${c_reset} \\\$ \n${c_glow}▋${c_reset} "

source /usr/share/bash-completion/bash_completion
#source /usr/share/fzf/key-bindings.bash
#source /usr/share/bash-completion/completions/fzf
#source /usr/share/bash-completion/completions/pass
source /usr/share/doc/fzf/examples/key-bindings.bash
# source /usr/share/bash-completion/completions/ssh

# Load completions.
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

if [ -f "/usr/share/doc/fzf/examples/key-bindings.bash" ]; then
	source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# Coloured `ls`.
export dircolors

# Don't require me to exit the pager if there is enough room.
export LESS="$LESS -FX"

# Save the SSH agent so we don't have to constantly type key passwords.
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# Links
# [1]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# related to [1]: https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html
