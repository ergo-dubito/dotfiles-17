# Set JAVA_HOME to satisfy Maven
export JAVA_HOME=$(/usr/libexec/java_home)

# Prefer updated software in /usr/local/bin over system defaults in /usr/bin.
export PATH="/usr/local/bin:$PATH"

# Make airport command available
export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"

# perlbrew
export PATH="$PATH:~/perl5/perlbrew/bin"
source ~/perl5/perlbrew/etc/bashrc

# Make Vim the default editor
export EDITOR=vim
export VISUAL=vim

# Source .extra if exists (personal settings not checked in with dotfiles)
[[ -f ~/.extra ]] && source ~/.extra

# Enable OpenGL Profiler
export GL_ENABLE_DEBUG_ATTACH YES

# Disable crash reporter
launchctl unload /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist &>/dev/null

# Load git completion script if it exists
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Configure terminal prompt appearance
export PS1='\u \W $ '

# Enable bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Make Android SDK tools & platform tools available (such as adb & fastboot)
# Make sure to define ANDROID_SDK in ~/.extra (absolute path to android sdk)
[[ -n "$ANDROID_SDK" ]] && export PATH=${PATH}:${ANDROID_SDK}/platform-tools:${ANDROID_SDK}/tools
