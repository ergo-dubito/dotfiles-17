#!/usr/bin/env bash

{ osascript <<END
  tell application "iTerm2"
    tell current window
      set scriptLauncherTab to (current tab)

      tell current session of scriptLauncherTab
        set name to "script launcher"
      end tell

      set pandora to (create tab with default profile)

      tell current session of pandora
        set name to "pandora"
        write text "cd ~"
        write text "pianobar"
      end tell

      set peril to (create tab with default profile)

      tell current session of peril
        set name to "peril"
        write text "cd ~/IdeaProjects/peril"
        write text "git branch"
        write text "git status"
      end tell

      set fg_tools to (create tab with default profile)

      tell current session of fg_tools
        set name to "fg-tools"
        write text "cd ~/IdeaProjects/fg-tools"
        write text "git branch"
        write text "git status"
      end tell

      set dotfiles to (create tab with default profile)

      tell current session of dotfiles
        set name to "dotfiles"
        write text "cd ~/dotfiles"
        write text "git branch"
        write text "git status"
      end tell

      close scriptLauncherTab
    end tell
  end tell
END
}
