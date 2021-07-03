CURRENT_BG='white'
SEGMENT_SEPARATOR=$'\ue0b0'

case ${SOLARIZED_THEME:-dark} in
    light) CURRENT_FG='white';;
    *)     CURRENT_FG='black';;
esac
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}


# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}
# get the nvm-controlled node.js version

function kubect_prompt_info() {
  # which nvm &>/dev/null || return
  # local nvm_prompt=${$(nvm current)#v}
  local kubectl_prompt="$(kubectl config current-context)"
  local kgnc_prompt="$(kubectl config view --minify --output 'jsonpath={..namespace}')"
  #  prompt_segment blue yellow 
  echo "${ZSH_THEME_KUBECTL_PROMPT_PREFIX}${kubectl_prompt}/${kgnc_prompt}${ZSH_THEME_KUBECTL_PROMPT_SUFFIX}"
}
