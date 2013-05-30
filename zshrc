ZSH=$HOME/.oh-my-zsh
ZSH_THEME="diegofrings"

plugins=(git bundler mercurial ruby rvm rails3 gem cap osx brew)

export PATH="/usr/local/bin:$HOME/bin:$PATH"
export EDITOR='subl -w'

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.completions
source ~/.functions

# autocorrect is more annoying than helpful
unsetopt correct_all

# for Homebrew installed rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
__rvm_project_rvmrc

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
