# ZSH Theme - Preview: https://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m %{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m %{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local kubectl_context='$(kubect_prompt_info)'
# local kubectl_context='%{$fg[red]%}‹$(kubectl config current-context)'
# local kgnc='%{$fg[green]%} $(kubectl config view --minify --output 'jsonpath={..namespace}')› %{$reset_color%}'
ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
# echo ZSH_THEME_KUBECTL_PROMPT_PREFIX="%{$fg[red]%}‹"
# ZSH_THEME_KGNC_PROMPT_SUFFIX="› %{$reset_color%}"
kube_prompt='%{$terminfo[bold]$fg[green]%}K8%B${user_symbol}%{$reset_color%}'

PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}
${kube_prompt} %B${kubectl_context}%b 
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"
ZSH_THEME_KUBECTL_PROMPT_PREFIX="%{$fg[blue]%}‹"
ZSH_THEME_KUBECTL_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
