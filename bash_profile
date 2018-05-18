# Set JAVA_HOME to satisfy Maven
export JAVA_HOME=$(/usr/libexec/java_home)

# Prefer updated software in /usr/local/bin over system defaults in /usr/bin.
export PATH="/usr/local/bin:$PATH"

# Make airport command available
export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"

# python
PYTHONPATH="$HOME/Library/Python/2.7/lib/python/site-packages:$PYTHONPATH"
export PYTHONPATH

# perlbrew
if type "perlbrew" > /dev/null 2>&1; then
  export PATH="$PATH:~/perl5/perlbrew/bin"
  source ~/perl5/perlbrew/etc/bashrc
fi

# Make Vim the default editor
export EDITOR=vim
export VISUAL=vim

# Source .extra if exists (personal settings not checked in with dotfiles)
[[ -f ~/.extra ]] && source ~/.extra

# Enable OpenGL Profiler
export GL_ENABLE_DEBUG_ATTACH YES

# Disable crash reporter
launchctl unload /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist &>/dev/null

# Configure terminal prompt appearance
export PS1='\u \W $ '

# Enable bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Git Completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# Make Android SDK tools & platform tools available (such as adb & fastboot)
# Make sure to define ANDROID_SDK in ~/.extra (absolute path to android sdk)
[[ -n "$ANDROID_SDK" ]] && export PATH=${PATH}:${ANDROID_SDK}/platform-tools:${ANDROID_SDK}/tools

# Disable CTRL + d logging out of terminal sessions
set -o ignoreeof
