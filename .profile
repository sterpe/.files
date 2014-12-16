# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# fink
test -r /sw/bin/init.sh && . /sw/bin/init.sh

# set PATH so it includes user's private /bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# OSX terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# System editor command
export EDITOR=ed

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home)

# mysql
PATH=$PATH:/usr/local/mysql/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DLYD_LIBRARY_PATH

# maven
PATH=$PATH:/Users/sterpe/.springsource/apache-maven-3.0.3/bin

# plan9
export PLAN9=/user/local/plan9
PATH=$PATH:$PLAN9/bin

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

# git
export GIT_SSL_NO_VERIFY=true

# git-completion
[[ -f "$HOME/.git-completion.bash" ]] \
	&& source "$HOME/.git-completion.bash"

# rvm 
[[ -s "$HOME/.rvm/scripts/rvm" ]] \
	&& source "$HOME/.rvm/scripts/rvm"
