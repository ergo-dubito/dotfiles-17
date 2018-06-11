#!/usr/bin/env bash

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
