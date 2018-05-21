#!/usr/bin/env bash

THIS_DIR="${BASH_SOURCE%/*}"
[[ ! -d "$THIS_DIR" ]] && THIS_DIR="$PWD"
[[ $(type -t "add_to_dock") != function ]] && . "$THIS_DIR/functions.sh"

# Install Homebrew (Should automatically trigger the prerequisite installation
# of Xcode Command Line Tools, if they aren't already installed. Another way to
# install them is to open Xcode for the first time.)

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# The preliminaries
brew update # Use the latest version of Homebrew.
brew upgrade # Upgrade all installed packages.

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
brew cask install iterm2
brew cask install java8 # Java 8 development
brew cask install google-chrome # Web browsing, why not? :)
brew cask install slack # You shouldn't work alone...

# Remove outdated versions from the cellar.
brew cleanup

# Update system shell to use the new Bash.
echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/bash;
exec bash

# Configure custom file assocations with Duti.
duti settings.duti

# Put freshly brewed applications in the Dock.
add_to_dock /Applications/iTerm.app
add_to_dock /Applications/Google\ Chrome.app
add_to_dock /Applications/MacVim.app
add_to_dock /Applications/Slack.app
