#!/usr/bin/env bash

THIS_DIR="${BASH_SOURCE%/*}"
[[ ! -d "$THIS_DIR" ]] && THIS_DIR="$PWD"
[[ $(type -t "bundle_id") != function ]] && . "$THIS_DIR/functions.sh"

SAVED_IFS=$IFS
IFS=$(echo -en "\n\b")

APPLICATIONS=( $(find /Applications ~/Applications -maxdepth 1 -name "*.app" -type d) )

for APPLICATION in "${APPLICATIONS[@]}"; do
  app_bundle_id ${APPLICATION}
done

IFS=$SAVED_IFS
