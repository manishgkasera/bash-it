#!/usr/bin/env bash
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="verbose"

RVM_THEME_PROMPT_PREFIX="${white}[${bold_green}"
RVM_THEME_PROMPT_SUFFIX="${white}]"
SCM_THEME_PROMPT_PREFIX="${white}("
SCM_THEME_PROMPT_SUFFIX="$white)"

#Mysql Prompt
export MYSQL_PS1="(\u@\h) [\d]> "

case $TERM in
        xterm*)
        TITLEBAR="\[\033]0;\w\007\]"
        ;;
        *)
        TITLEBAR=""
        ;;
esac

function ip {
  if [ "$(ips | wc -l)" -ne 1 ]; then
    echo -e "$(ips | sed -e :a -e '$!N;s/\n/, /;ta' | sed -e 's/127\.0\.0\.1\, //g' | sed -e 's/addr://g')"
  fi
}

function battery_per {
  local p=$(battery_percentage)
  if [ $p -lt 30 ]; then
    local color=${bold_red}
  fi
  echo -e "$RVM_THEME_PROMPT_PREFIX$color$p%$RVM_THEME_PROMPT_SUFFIX"
}

function git_file_count {
  local st=$(git status --porcelain 2> /dev/null)
  local afiles=$(grep '^A' <<< "$st" | wc -l)
  local smfiles=$(grep -E '^MM? ' <<< "$st" | wc -l)
  local mfiles=$(grep '^.M ' <<< "$st" | wc -l)
  local cfiles=$(grep '^ C ' <<< "$st" | wc -l)
  local rfiles=$(grep '^R ' <<< "$st" | wc -l)
  local sdfiles=$(grep '^D ' <<< "$st" | wc -l)
  local dfiles=$(grep '^ D ' <<< "$st" | wc -l)
  local ufiles=$(grep '^\?? ' <<< "$st" | wc -l)
  if [ $afiles -gt 0 ]; then
    FILE_COUNTS="${bold_green}A:$afiles "
  fi
  if [ $smfiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${bold_green}M:$smfiles "
  fi
  if [ $mfiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${bold_red}M:$mfiles "
  fi
  if [ $cfiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${bold_green}C:$cfiles "
  fi
  if [ $rfiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${bold_green}R:$rfiles "
  fi
  if [ $sdfiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${bold_green}D:$sdfiles "
  fi
  if [ $dfiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${bold_red}D:$dfiles "
  fi
  if [ $ufiles -gt 0 ]; then
    FILE_COUNTS="$FILE_COUNTS${red}U:$ufiles"
  fi
}

function scm_prompt_info_plus {
	if [ -n "$(__gitdir)" ]; then
    git_file_count
    git_prompt_vars
    echo -e "$SCM_THEME_PROMPT_PREFIX${bold_green}$(__git_ps1 '%s' | sed -e 's/ / $(echo -e $echo_bold_red)/')$SCM_THEME_PROMPT_SUFFIX $FILE_COUNTS"
  else
    scm_prompt_info
	fi
}

function prompt() {
  PS1=" $(battery_per)$(ruby_version_prompt) ${bold_blue}\w${normal}$(scm_prompt_info_plus)\n\
 ${bold_yellow}$(ip) ${bold_purple}$(scm_char)${reset_color} » "
  PS2='> '
  PS4='+ '
}

PROMPT_COMMAND=prompt