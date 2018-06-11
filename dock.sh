#! /usr/bin/env bash

if [[ !  $(type "dockutil")  ]] > /dev/null 2>&1; then
  printf "\nError: Not configuring dock: dockutil not installed.\n"
  exit 1
fi

# Reset Dock to default state before starting.
printf "\nResetting dock to default state...\n"
defaults delete com.apple.dock; killall Dock
printf "\nDone.\n"

# Wait at least 5 seconds or the next command will fail.
printf "\nWaiting 5 seconds for Dock to recover...\n"
sleep 5
printf "\nDone.\n"

# Wipe all default app icons from the Dock before starting.
printf "\nCompletely emptying all app icons from the Dock...\n"
defaults write com.apple.dock persistent-apps -array; killall Dock
printf "\nDone.\n"

# Configure dock apps, folders, files, & links.
printf "\nUsing dockutil to customize the Dock...\n"
dockutil --add /Applications/Launchpad.app
dockutil --add /Applications/Calendar.app
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /Applications/Utilities/Activity\ Monitor.app
dockutil --add /Applications/IntelliJ\ IDEA\ CE.app
dockutil --add /Applications/iTerm.app --replacing 'iTerm' # In case it's open & running this script
dockutil --add /Applications/MacVim.app
dockutil --add /Applications/Slack.app
dockutil --add "`ls -dt /Applications/1Password*|head -1`" # Name changes depending on version :'(
dockutil --add /Applications/iTunes.app
dockutil --add /Applications/Messages.app
dockutil --add /Applications/Reminders.app
dockutil --add /Applications/Notes.app
dockutil --add /Applications/System\ Preferences.app
dockutil --add ~/Downloads --section others --view list --display folder --sort kind --replacing 'Downloads' # It's already there; just change its layout
dockutil --add ~/Sync/Business/Forerunner\ Games/peril/scripts/aaron/peril-scripts --section others --view list --display folder --sort name
dockutil --add ~/Sync/Business/Forerunner\ Games/peril/documents/peril-todo.txt --section others
dockutil --add ~/Sync/Personal/software/dotfiles/dotfiles-todo.txt --section others
dockutil --add ~/Sync/Personal/software/vim/vim-notes.txt --section others
dockutil --add ~/Sync/Personal/software/git/git-notes.txt --section others
dockutil --add http://ci.forerunner.games --label 'peril: Build Artifacts' --section others
dockutil --add https://travis-ci.org/forerunnergames/peril --label 'peril: Travis' --section others
dockutil --add https://travis-ci.org/forerunnergames/fg-tools --label 'fg-tools: Travis' --section others
dockutil --add https://github.com/forerunnergames/peril --label 'peril: GitHub' --section others
dockutil --add https://github.com/forerunnergames/fg-tools --label 'fg-tools: GitHub' --section others
dockutil --add https://github.com/3xp0n3nt/dotfiles --label 'dotfiles: GitHub' --section others
printf "\nDone.\n"