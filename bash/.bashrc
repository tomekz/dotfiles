# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
# set -o vi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~
export PS1='\w '

export VISUAL=nvim
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME"/.config

if [[ "$unamestr" == 'Linux' ]]; then
    export GOPATH=/usr/local/go
else
    export GOPATH=$HOME/go
fi
export PATH=$GOPATH/bin:/opt/homebrew/bin:/opt/nvim-linux64/bin:$HOME/.local/share/nvim/mason/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace


# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
# ls
alias v=nvim
alias ls='ls --color=auto'
alias ll='ls -la'
# alias la='exa -laghm@ --all --icons --git --color=always'
alias la='ls -lathr'

alias lzg='lazygit'
alias lzd='lazydocker'

# sourcing
# Set up fzf key bindings and fuzzy completion
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   source /usr/share/doc/fzf/examples/key-bindings.bash
else
   source "$HOME/.fzf.bash"
fi
# kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'

# --------------------------- smart prompt ---------------------------

PROMPT_AT=@

__ps1() {
	local P='$' dir="${PWD##*/}" B short \
		r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
		u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
		b='\[\e[36m\]' x='\[\e[0m\]'

	[[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
	[[ $PWD = / ]] && dir=/
	[[ $PWD = "$HOME" ]] && dir='~'

	B=$(git branch --show-current 2>/dev/null)
	[[ $dir = "$B" ]] && B=.

	[[ $B == master || $B == main ]] && b="$r"
	[[ -n "$B" ]] && B="$g($b$B$g)"

	short="$w$dir$B$p$P$x "

	PS1="$short"
}

PROMPT_COMMAND="__ps1"

#aws sso login function with tab completion with list of available AWS profiles from the `~/.aws/config` 
function aws_login(){
    export AWS_VAULT=""
    aws-vault exec $1 
}

_aws_login(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    local options_set="$(awk '/^\[profile/ {print $2}' ~/.aws/config | sed 's/]//' | tr '\n' ' ')"
    COMPREPLY=( $(compgen -W "$options_set" -- $cur) )
}
complete -F _aws_login aws_login
