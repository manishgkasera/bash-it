#!/bin/bash

# virtualenv aliases
# http://blog.doughellmann.com/2010/01/virtualenvwrapper-tips-and-tricks.html
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

function virtualenv-help() {
  echo "Virtual Environment Aliases Usage"
  echo
  echo "alias v                ='workon'"
  echo "alias v.deactivate     ='deactivate'"
  echo "alias v.mk             ='mkvirtualenv --no-site-packages'"
  echo "alias v.mk_withsitepackages='mkvirtualenv'"
  echo "alias v.rm             ='rmvirtualenv'"
  echo "alias v.switch         ='workon'"
  echo "alias v.add2virtualenv ='add2virtualenv'"
  echo "alias v.cdsitepackages ='cdsitepackages'"
  echo "alias v.cd             ='cdvirtualenv'"
  echo "alias v.lssitepackages ='lssitepackages'"
  echo
}
