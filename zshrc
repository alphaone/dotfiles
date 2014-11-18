ZSH=$HOME/.oh-my-zsh
ZSH_THEME="diegofrings"

plugins=(git mercurial osx brew)

export EDITOR='subl -w'

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.completions
source ~/.functions
source ~/.java_paths
source ~/.paths

# autocorrect is more annoying than helpful
unsetopt correct_all

# for Homebrew installed rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
__rvm_project_rvmrc
