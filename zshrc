ZSH=$HOME/.oh-my-zsh
ZSH_THEME="diegofrings"

plugins=(git osx brew docker docker-compose)

export EDITOR='vim'

source $ZSH/oh-my-zsh.sh
source ~/.aliases
source ~/.completions
source ~/.functions
source ~/.java_paths
source ~/.paths
source ~/.awsrc

# autocorrect is more annoying than helpful
unsetopt correct_all
