#!/usr/bin/env bash

# Set variables.
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.local/config}"
BACKUP_DIR=$(mktemp --directory --tmpdir=${HOME})
FILES=(".bash_profile" ".bashrc" ".profile" ".screenrc" ".vimrc")

# Create directories.
mkdir -p "${XDG_CONFIG_HOME}"/{bash,screen,vim} ${HOME}/binary

# Move repo files to destination.
cp -i -v "${PWD}/aliases" "${XDG_CONFIG_HOME}/bash/aliases"
cp -i -v "${PWD}/bash_profile" "${XDG_CONFIG_HOME}/bash/bash_profile"
cp -i -v "${PWD}/bashrc" "${XDG_CONFIG_HOME}/bash/bashrc"
cp -i -v "${PWD}/editor" "${HOME}/binary"
cp -i -v "${PWD}/profile" "${HOME}/.profile"
cp -i -v "${PWD}/screenrc" "${XDG_CONFIG_HOME}/screen/screenrc"
cp -i -v "${PWD}/vimrc" "${XDG_CONFIG_HOME}/vim/vimrc"

# Move original files to backup dir.
for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    mv -v "$file" "${BACKUP_DIR}"
  fi
done

# Update the base bashrc to source the new file.
cat << EOF > "${HOME}/.bashrc"
# Read ~/.bash_profile even though this is an interactive session.

if [[ -e ~/.bash_profile ]]; then
  . "${HOME}/.bash_profile"
fi

if [[ -n "$XDG_CONFIG_HOME" ]]; then
  . "${XDG_CONFIG_HOME}/bash/bashrc
fi
EOF

cat << EOF > "${HOME}/.bash_profile"
if [[ -f ~/.profile ]]; then
  . ~/.profile
fi
EOF

echo "Configuration files have been moved to ${XDG_CONFIG_HOME}."
echo "Original files have been moved to ${BACKUP_DIR}."
echo "Please source your .bashrc to apply changes:"
echo "-> source ~/.bashrc"
