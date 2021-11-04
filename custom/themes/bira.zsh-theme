# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

function toon {
  echo -n ""
}
function k8sSymbol {
  echo -n " ☸ "
}
function gitSymbol {
  echo -n " \uE0A0 "
}

function kubect_prompt_info() {
  # which nvm &>/dev/null || return
  # local nvm_prompt=${$(nvm current)#v}
  local kubectl_prompt="$(kubectl config current-context)"
  local kgnc_prompt="$(kubectl config view --minify --output 'jsonpath={..namespace}')"
  #  prompt_segment blue yellow 
  echo -n "${ZSH_THEME_KUBECTL_PROMPT_PREFIX}${kgnc_prompt}${ZSH_THEME_KUBECTL_PROMPT_SUFFIX}"
}

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n %{$reset_color%}'
    local user_symbol='$'
fi
local k8s_symbol='%{$fg[blue]%}$(k8sSymbol) $(kubect_prompt_info) %{$reset_color%}'

local current_dir='%{$fg[white]%}$(toon)%  %{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${user_host}${k8s_symbol}${git_branch}
${current_dir}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}$(gitSymbol)%{$reset_color%} %{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
