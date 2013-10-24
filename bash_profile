# Prefer updated software in /usr/local/bin over system defaults in /usr/bin.
export PATH="/usr/local/bin:$PATH"

# airport
export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"

# perlbrew
export PATH="$PATH:~/perl5/perlbrew/bin"
source ~/perl5/perlbrew/etc/bashrc

# vim
export EDITOR=vim
export VISUAL=vim

# Source .extra if exists (personal settings not checked in with dotfiles)
[[ -f ~/.extra ]] && source ~/.extra

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# OpenGL Profiler
export GL_ENABLE_DEBUG_ATTACH YES

# Disable crash reporter
launchctl unload /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist &>/dev/null
