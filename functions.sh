#!/usr/bin/env bash

create_dotfile() {
  DOTFILE="$1"
  printf "Checking for $DOTFILE...\n"
  if [[ ! -f $DOTFILE ]]; then
   read -p "~/$DOTFILE not found. Create an empty one? (y/n)?" choice
   case "$choice" in
     y|Y ) touch $DOTFILE;;
     n|N ) ;;
     * ) echo "Invalid choice";;
   esac
  else
   printf "~/$DOTFILE already exists. Skipping...\n"
  fi
  printf "Done.\n\n"
}

app_bundle_id() {
  osascript -e "id of app \"$*\""
}

app_uti() {
  local f="/tmp/me.lri.getuti.${1##*.}"
  touch "$f"
  mdimport "$f"
  mdls -name kMDItemContentTypeTree "$f"
  rm "$f"
}

add_to_dock() {
  if [[ ! -z $1 ]]; then
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"; killall Dock
  else
    printf "\nError: No application path specified, exiting.\n\n"
    return 1
  fi
}
