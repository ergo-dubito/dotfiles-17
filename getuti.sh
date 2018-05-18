#!/usr/bin/env bash

THIS_DIR="${BASH_SOURCE%/*}"
[[ ! -d "$THIS_DIR" ]] && THIS_DIR="$PWD"
[[ $(type -t "app_uti") != function ]] && . "$THIS_DIR/functions.sh"

app_uti "$1"
