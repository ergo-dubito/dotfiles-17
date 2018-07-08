#!/usr/bin/env bash

# Install Travis CLI for encrypting credentials.
printf "Installing Ruby gems...\n"
gem install travis
gem install slackcat
printf "Done.\n\n"
