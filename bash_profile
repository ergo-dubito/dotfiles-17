# Use vim (7.3), mvim (MacVim startup script), and vi (symlinked to vim 7.3) in
# /usr/local/bin rather than vim (7.2) and vi (symlinked to vim 7.2) in
# /usr/bin/vim. To do this, /usr/local/bin must be prepended to the '$PATH' so
# it is loaded before /usr/bin.
export PATH="/usr/local/bin/:$PATH"

# Set perl library path so perl modules can find dependencies like git.pm.
export PERL5LIB="$PERL5LIB:/usr/local/git/lib/perl5/site_perl/"

# Make vim (7.3) the default editor.
export EDITOR=vim

# Make 'airport' command available.
export PATH="$PATH:/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/"

# Make 'eclimd' command available.
# Starts a headless Eclipse server that provides Eclipse funciontality in vim.
alias eclimd='/Applications/eclipse/eclimd'

# Android Development Tools
export PATH="$PATH:~/android/tools:~/android/platform-tools/"

# Fink Project
test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_17.jdk/Contents/Home

# MD5
alias md5='md5 -r'
alias md5sum='md5 -r'

# Python
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin/"
