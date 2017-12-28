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
  if [ -f "$HOME/.bash_local" ]; then
    . "$HOME/.bash_local"
  fi
fi

# set PATH so it includes user's private /bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

export INFOPATH=/usr/local/share/info:$INFOPATH

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fink
test -r /sw/bin/init.sh && . /sw/bin/init.sh

# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

# OSX terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# System editor command
export EDITOR=ed

# yarn
export PATH="$PATH:`yarn global bin`"

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_92)

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# git-completion
[[ -f "$HOME/.git-completion.bash" ]] \
	&& source "$HOME/.git-completion.bash"

# lein-completion
[[ -s  /usr/local/etc/bash_completion.d/lein-completion.bash ]] && \
  .  /usr/local/etc/bash_completion.d/lein-completion.bash

# nvm
export NVM_DIR=/Users/sterpe/.nvm
[ -s /usr/local/nvm/nvm.sh ] && . /usr/local/nvm/nvm.sh && nvm use 8

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
