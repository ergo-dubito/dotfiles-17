#!/usr/bin/env bash

printf "Installing dotfiles...\n\n"

ask_for_sudo

cd ~

printf "Copying dotfiles to \$HOME directory ($HOME)...\n\n"

ln -s dotfiles/git/gitconfig .gitconfig
ln -s dotfiles/git/gitignore_global .gitignore_global
ln -s dotfiles/vim .vim
ln -s dotfiles/pianobar/config .config
ln -s dotfiles/bash_profile .bash_profile
ln -s dotfiles/cvimrc .cvimrc
ln -s dotfiles/hushlogin .hushlogin
ln -s dotfiles/ideavimrc .ideavimrc
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/iterm2/dev.sh .dev

printf "Done.\n\n"

source dotfiles/brew.sh
source dotfiles/macos.sh
source dotfiles/gems.sh
source dotfiles/dock.sh
source dotfiles/iterm2/iterm2.sh
source dotfiles/android.sh

# Configure XCode
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer # See https://stackoverflow.com/a/17980786/711807
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch # Install additional components

# Update system shell to use the new Bash.
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/bash;
exec bash

# Speed up IntelliJ Idea with custom performance settings.
cp idea.vmoptions "`ls -dt ~/Library/Preferences/IdeaIC*|head -1`/"

# Configure custom file assocations with Duti.
duti settings.duti

printf "\n\nConfiguring Shell Environment (sourcing ~/.bash_profile)...\n"
source .bash_profile
printf "Done.\n\n"

printf "\n\nDon't forget to create the following local dotfiles with your personal information:\n\n"
printf "~/.extra (Git authorship and any other env vars containing personal info.)\n"
printf "~/.gitconfig_local (Included in .gitconfig, for the [user] block and any other personal info.)\n\n"

function ask_for_sudo() {
  info "Prompting for sudo password..."
  if sudo --validate; then
    # Keep-alive
    while true; do sudo --non-interactive true; \
      sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
  else
    error "Obtaining sudo credentials failed."
    exit 1
  fi
}
