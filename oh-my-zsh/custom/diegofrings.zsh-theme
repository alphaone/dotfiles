# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:   June 19, 2012
# Last modified on: June 20, 2012

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# color vars
eval branch_color='$FG[075]'
eval dirty_color='$FG[214]'
eval line_color='$FG[237]'
eval base_color='$FG[032]'
eval rvm_color='$FG[156]'

# primary prompt
PROMPT='$line_color------------------------------------------------------------%{$reset_color%}
$base_color%~\
$(git_prompt_info) \
$FG[164]$(aws_profile)%{$reset_color%} \
%{$rvm_color%}$(rvm_prompt)%{$reset_color%}
$FG[105]%(!.#.$(prompt_char))%{$reset_color%} '

#PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

#RPS1='${return_code}'



# right prompt
RPROMPT='$my_gray%n@%m%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$branch_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$dirty_color%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$dirty_color%}?%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function hg_prompt_info {
    hg prompt --angle-brackets "< on %{$branch_color%}<branch>%{$reset_color%}><%{$base_color%} at %{$branch_color%}<tags|%{$reset_color%}, %{$branch_color%}>%{$reset_color%}>%{$dirty_color%}<status|modified|unknown><update>%{$reset_color%}<patches: <patches|join( → )|pre_applied(%{$branch_color%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

function rvm_prompt {
    echo "$(rbenv version | sed -e "s/ (set.*$//")"
}

function aws_profile {
    echo "[$AWS_PROFILE]"
}
