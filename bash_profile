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
defaults write com.apple.CrashReporter DialogType none

# Configure terminal prompt appearance
export PS1='\u \W $ '

# Bash Completion 2
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi

# Git Completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# Git
[[ -v  "$GIT_AUTHOR_NAME" ]] && export GIT_AUTHOR_NAME
[[ -v  "$GIT_AUTHOR_EMAIL" ]] && export GIT_AUTHOR_EMAIL
[[ -v  "$GIT_COMMITTER_NAME" ]] && export GIT_COMMITTER_NAME
[[ -v  "$GIT_COMMITTER_EMAIL" ]] && export GIT_COMMITTER_EMAIL

# Make Android SDK tools & platform tools available (such as adb & fastboot)
# Make sure to define ANDROID_SDK in ~/.extra (absolute path to android sdk)
[[ -v "$ANDROID_SDK" ]] && export ANDROID_SDK
[[ -n "$ANDROID_SDK" ]] && export PATH=${PATH}:${ANDROID_SDK}/platform-tools:${ANDROID_SDK}/tools

# Disable CTRL + d logging out of terminal sessions
set -o ignoreeof

# Git GPG commit signing.
export GPG_TTY=$(tty)
