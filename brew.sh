#!/usr/bin/env bash

# Install Homebrew (Should automatically trigger the prerequisite installation
# of Xcode Command Line Tools, if they aren't already installed. Another way to
# install them is to open Xcode for the first time.)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run the Brewfile.
brew bundle
