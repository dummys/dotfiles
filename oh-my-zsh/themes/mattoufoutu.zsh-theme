function loadavg_info() {
    local -h one five fifteen rest
    read one five fifteen rest < /proc/loadavg
    print "$one $five $fifteen"
}

function hg_prompt_info {
    hg prompt --angle-brackets "\
$HG_PROMPT_BRANCH\
$HG_PROMPT_TAGS\
$HG_PROMPT_STATUS\
$HG_PROMPT_PATCHES" 2>/dev/null
}

function prompt_char {
    if [[ `whoami` == 'root' ]]; then
        print "#"
    else
        print "\$"
    fi
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT_HOST="%{$fg_bold[green]%}(%n%{$reset_color%}@%{$fg_bold[green]%}%m)%{$reset_color%}"
PROMPT_DATE="%{$fg[yellow]%}[%*]%{$reset_color%}"
PROMPT_INPUT="%{$fg[blue]%}-> %{$fg_bold[blue]%}$(prompt_char)%{$reset_color%}"
PROMPT_PATH="%{$fg[white]%}[%~]%{$reset_color%}"

#HG_PROMPT_BRANCH="<%{$fg[green]%}[hg:<branch>%{$reset_color%}>"
#HG_PROMPT_TAGS="< @ %{$fg[yellow]%}<tags|%{$reset_color%},%{$fg[yellow]%}>%{$fg[green]%}]%{$reset_color%}>"
#HG_PROMPT_STATUS="%{$fg[green]%}<status|modified|unknown><update>%{$reset_color%}"
#HG_PROMPT_PATCHES="<patches: <patches|join(→)|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[white]%})|post_unapplied(%{$reset_color%})>>"

PROMPT='$PROMPT_HOST $PROMPT_PATH $PROMPT_DATE $(git_prompt_info)
$PROMPT_INPUT '
RPS1="$return_code"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✘%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[red]%}±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔%{$reset_color%}"

