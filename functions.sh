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
