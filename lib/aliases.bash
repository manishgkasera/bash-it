#!/bin/bash

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'

alias c='clear'
alias k='clear'

alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories
alias -- -="cd -"       # Go back

alias fn='find . -name'
alias fr='find . -regexp'

alias cvss='cvs -n up'
alias cvsu='cvs up -d 2>&1 | grep -v "cvs update"'

alias dev_appserver.py='/usr/local/lib/google_appengine/dev_appserver.py'
alias appcfg.py='/usr/local/lib/google_appengine/appcfg.py'
alias sagi='sudo apt-get install'

# Shell History
alias h='history'

# Directory
alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v'

function aliases-help() {
  echo "Generic Alias Usage"
  echo
  echo "  sl    = ls"
  echo "  ls    = ls -G"
  echo "  la    = ls -AF"
  echo "  ll    = ls -al"
  echo "  l     = ls -a"
  echo "  c/k   = clear"
  echo "  ..    = cd .."
  echo "  ...   = cd ../.."
  echo "  -     = cd -"
  echo "  h     = history"
  echo "  md    = mkdir -p"
  echo "  rd    = rmdir"
  echo "  d     = dirs -v"
  echo "  fn    = find . -name"
  echo "  fr    = find . -regexp"
  echo '  cvss  = cvs -n up'
  echo '  cvsu  = cvs up -d 2>&1 | grep -v "cvs update"'
}