# Prefer updated software in /usr/local/bin over system defaults in /usr/bin.
export PATH="/usr/local/bin:$PATH"

# airport
export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources"

# eclimd
alias eclimd='/Applications/eclipse/eclimd'

# perlbrew
export PATH="$PATH:~/perl5/perlbrew/bin"
source ~/perl5/perlbrew/etc/bashrc

# vim
export EDITOR=vim
export VISUAL=vim

# Source .extra if exists (personal settings not checked in with dotfiles)
[[ -f ~/.extra ]] && source ~/.extra
