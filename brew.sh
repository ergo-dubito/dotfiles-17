#!/usr/bin/env bash

# Install Homebrew (Should automatically trigger the prerequisite installation
# of Xcode Command Line Tools, if they aren't already installed. Another way to
# install them is to open Xcode for the first time.)
printf "Installing Homebrew...\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
printf "Done.\n\n"

# Ensure everything is up-to-date first.
printf "Updating Homebrew...\n"
brew update
brew upgrade
printf "Done.\n\n"

# Run the Brewfile to install Formulae.
printf "Installing Homebrew Formulae...\n"
brew bundle
printf "Done.\n\n"

printf "Cleaning up after installing Homebrew formula...\n"
brew cleanup
printf "Done.\n\n"
