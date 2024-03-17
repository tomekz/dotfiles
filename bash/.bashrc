# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
# set -o vi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~
export PS1='\w '

export VISUAL=nvim
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME"/.config

export PATH=/opt/homebrew/bin:$HOME/nvim-macos/bin:$HOME/.local/share/nvim/mason/bin:$PATH

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
source "$HOME/.fzf.bash"

# brew bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
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
