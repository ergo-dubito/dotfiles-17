#!/usr/bin/env bash

printf "Configuring iTerm2...\n\n"

set -e

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1

mkdir -p "~/Library/Application Support/iTerm2"
rm -rf "~/Library/Application Support/iTerm2/DynamicProfiles"

ln -sfhF ~/.dotfiles/iterm2/profiles ~/Library/Application\ Support/iTerm2/DynamicProfiles

printf "\nDone.\n\n"
