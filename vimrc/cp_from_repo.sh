#!/bin/bash
#
# Copy files from repo folder to  ~/.vimrc and ~/vim/*.vim

# create the directories if not present
[ -d ~/vim ] || mkdir ~/vim
[ -d ~/vim/backup ] || mkdir ~/vim/backup

# make backups
echo "Creating backups in ~/vim/backup"
cp ~/.vimrc ~/vim/backup/vimrc_std
cp ~/vim/*.vim ~/vim/backup/.

# Copy from repo to home directories
echo "Copying from repo to ~/.vimrc and ~/vim/"
cp vimrc_std ~/.vimrc
cp *.vim ~/vim/.
