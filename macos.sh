#!/usr/bin/env bash

# MacOS High Sierra settings

printf "\nConfiguring MacOS...\n"

[[ -v $COMPUTERNAME ]] && sudo scutil --set ComputerName "$COMPUTERNAME"
[[ -v $LOCALHOSTNAME ]] && sudo scutil --set LocalHostName "$LOCALHOSTNAME"
[[ -v $HOSTNAME ]] && sudo scutil --set HostName "$HOSTNAME"

# Flush the DNS cache if we set any of these 3 names.
[[ -v "$COMPUTERNAME" || -v  "$LOCALHOSTNAME" || -v  "$HOSTNAME" ]] && dscacheutil -flushcache

# Show full file path in Finder title bar.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Prevent creation of .DS_Store files on network drives.
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Make sure any changes update immediately by restarting Finder.
sudo killall -KILL Finder

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Performance Optimizations (Mainly for older Mac's):

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Finder: Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Disable focus ring animation
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Disable send and reply animations in Mail.app
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Disable disk image verification (e.g., opening .dmg files).
defaults write com.apple.frameworks.diskimages  skip-verify -bool true
defaults write com.apple.frameworks.diskimages  skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages  skip-verify-remote -bool true

# Never ask “Are you sure you want to open this application?” again.
sudo spctl --master-disable

# Save screenshots to ~/Downloads instead of ~/Desktop.
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Keep folders on top when sorting by name in Finder.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Make list view the default for Finder windows.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Don't warn when emptying the trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false

printf "Done.\n\n"
