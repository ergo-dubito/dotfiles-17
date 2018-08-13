# -----------------------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------------------

# Prefer updated software in /usr/local/bin over system defaults in /usr/bin.
# This should come FIRST in ~/.bash_profile.
export PATH="/usr/local/bin:$PATH"

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# ~/.extra
# -----------------------------------------------------------------------------

# Source ~/.extra if exists (personal settings not checked in with dotfiles).
# This should come SECOND in ~/.bash_profile.
[[ -f ~/.extra ]] && source ~/.extra

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Python
# -----------------------------------------------------------------------------

PYTHONPATH="$HOME/Library/Python/2.7/lib/python/site-packages${PYTHONPATH:+":$PYTHONPATH"}"
export PYTHONPATH

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Terminal
# -----------------------------------------------------------------------------

# Configure prompt appearance.
export PS1='\u \W $ '

# Disable CTRL + d logging out of sessions.
set -o ignoreeof

# Bash Completion 2
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Vim
# -----------------------------------------------------------------------------

# Set as default editor.
export EDITOR=vim
export VISUAL=vim

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Git
# -----------------------------------------------------------------------------

# Completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

# Commit authorship (define in ~/.extra)
[[ -v "$GIT_AUTHOR_NAME" ]] && export GIT_AUTHOR_NAME
[[ -v "$GIT_AUTHOR_EMAIL" ]] && export GIT_AUTHOR_EMAIL
[[ -v "$GIT_COMMITTER_NAME" ]] && export GIT_COMMITTER_NAME
[[ -v "$GIT_COMMITTER_EMAIL" ]] && export GIT_COMMITTER_EMAIL

# GPG commit signing
export GPG_TTY=$(tty)

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Perlbrew
# -----------------------------------------------------------------------------

if type "perlbrew" > /dev/null 2>&1; then
  export PATH="$PATH:~/perl5/perlbrew/bin"
  source ~/perl5/perlbrew/etc/bashrc
fi

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Android
# -----------------------------------------------------------------------------

# Make SDK location available (define in ~/.extra).
[[ -v "$ANDROID_SDK" ]] && export ANDROID_SDK

# Make SDK tools & platform tools available (such as adb & fastboot).
[[ -n "$ANDROID_SDK" ]] && export PATH=${PATH}:${ANDROID_SDK}/platform-tools:${ANDROID_SDK}/tools

# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
# Miscellaneous
# -----------------------------------------------------------------------------

# Set JAVA_HOME to satisfy Maven.
export JAVA_HOME=$(/usr/libexec/java_home)

# Airport
export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"

# OpenGL Profiler
export GL_ENABLE_DEBUG_ATTACH YES

# -----------------------------------------------------------------------------
