#!/usr/bin/env bash

THIS_DIR="${BASH_SOURCE%/*}"
[[ ! -d "$THIS_DIR" ]] && THIS_DIR="$PWD"
[[ $(type -t "create_dotfile") != function ]] && . "$THIS_DIR/functions.sh"

printf "Installing dotfiles...\n\n"

cd ~

printf "Copying dotfiles to HOME directory ($HOME)...\n\n"

ln -s dotfiles/git/gitconfig .gitconfig
ln -s dotfiles/git/gitignore_global .gitignore_global
ln -s dotfiles/vim .vim
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/cvimrc .cvimrc
ln -s dotfiles/hushlogin .hushlogin
ln -s dotfiles/ideavimrc .ideavimrc
ln -s dotfiles/osx .osx
ln -s dotfiles/vimrc .vimrc

printf "Done.\n\n"

create_dotfile ~/.extra
create_dotfile ~/.gitconfig_local

printf "\nConfiguring Shell Environment (sourcing ~/.bash_profile)...\n"
source $THIS_DIR/.bash_profile
printf "Done.\n\n"

printf "\nConfiguring MacOS (sourcing ~/.osx)...\n"
source $THIS_DIR/.osx
printf "Done.\n\n"

printf "\nDotfiles have been installed. Don't forget to configure any of the following local dotfiles with your personal information:\n\n"

printf "~/.extra (Git authorship and any other env vars containing personal info.)\n"
printf "~/.gitconfig_local (Included in .gitconfig, for the [user] block and any other personal info.)\n\n"
