export PATH=${HOME}/binary:${HOME}/.local/bin:${PATH}
export PASSWORD_STORE_DIR=${HOME}/.local/config/pass
export EDITOR=${HOME}/binary/editor
export XDG_DATA_HOME="${HOME}/.local/share" # see [1]
export XDG_CONFIG_HOME=${HOME}/.local/config
export XDG_STATE_HOME=${HOME}/.local/state
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC' # see [2]

# Links
# [1]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# [2]: https://tlvince.com/vim-respect-xdg
