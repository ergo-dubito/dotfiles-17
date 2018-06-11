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
ln -s dotfiles/pianobar/config .config
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/cvimrc .cvimrc
ln -s dotfiles/hushlogin .hushlogin
ln -s dotfiles/ideavimrc .ideavimrc
ln -s dotfiles/macos .macos
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/iterm2/dev.sh .dev

printf "Done.\n\n"

create_dotfile ~/.extra
create_dotfile ~/.gitconfig_local

printf "\nConfiguring Shell Environment (sourcing ~/.bash_profile)...\n"
source .bash_profile
printf "Done.\n\n"

printf "\nConfiguring MacOS (sourcing ~/.macos)...\n"
source .macos
printf "Done.\n\n"

printf "\nDotfiles have been installed. Don't forget to configure any of the following local dotfiles with your personal information:\n\n"

printf "~/.extra (Git authorship and any other env vars containing personal info.)\n"
printf "~/.gitconfig_local (Included in .gitconfig, for the [user] block and any other personal info.)\n\n"

printf "Installing Homebrew & packages...\n"
source dotfiles/brew.sh
printf "Done.\n\n"

printf "Installing gems...\n"
source dotfiles/gems.sh
printf "Done.\n\n"

printf "Configuring Dock...\n"
source dotfiles/dock.sh
printf "Done.\n\n"

source dotfiles/iterm2/iterm2.sh

# Update system shell to use the new Bash.
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/bash;
exec bash

# Speed up IntelliJ Idea with custom performance settings.
cp idea.vmoptions "`ls -dt ~/Library/Preferences/IdeaIC*|head -1`/"

# Configure custom file assocations with Duti.
duti settings.duti
