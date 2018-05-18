#!/usr/bin/env bash

# Install Homebrew (Should automatically trigger the prerequisite installation
# of Xcode Command Line Tools, if they aren't already installed. Another way to
# install them is to open Xcode for the first time.)

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Required to install various Casks.
brew tap caskroom/cask
brew tap caskroom/versions

# Install newer versions of bash, git, vim.
brew install bash
brew install bash-completion@2 # Bash tab completion
brew install git
brew install vim --with-override-system-vi # get system clipboard support
brew cask install macvim --override-system-vim # get MacVim.app in /Applications
brew install findutils --with-default-names # get cool 'find' options like -printf
brew install duti # easy custom file associations
brew cask install java8 # Java 8 development

# Update system shell to use the new Bash.
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/bash;
exec bash

# Configure custom file assocations with Duti.
duti settings.duti
