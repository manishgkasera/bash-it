#!/bin/bash

# Aliases
alias vs='cvs -n up 2>&1 | grep -v "cvs update:"'
alias vu='cvs up -dP 2>&1 | grep -v "cvs update:"'
alias vd='cvs diff'
alias va='cvs add'
alias vc='cvs commit'
alias vr='cvs remote'
alias vl='cvs log'
alias vly='cvs log -d yesterday'

function cvs-help() {
  echo "CVS Custom Aliases Usage"
  echo
  echo "  vs	  = cvs -n up"
  echo "  vd      = cvs diff \"$@\" | colordiff"
  echo "  va 	  = cvs add"
  echo "  vc      = cvs commit"
  echo "  vr      = cvs remove"
  echo "  vly     = cvs log -d yesterday"
  echo
}
