#!/usr/bin/env bash

printf "\n\nConfiguring Android SDK...\n"
yes | /usr/local/share/android-sdk/tools/bin/sdkmanager --licenses
/usr/local/share/android-sdk/tools/bin/sdkmanager "tools" "platform-tools" "platforms;android-23" "build-tools;23.0.3" "extras;android;m2repository" "extras;google;m2repository"
/usr/local/share/android-sdk/tools/bin/sdkmanager --update
printf "Done.\n\n"
