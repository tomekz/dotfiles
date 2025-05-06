export GOROOT=/home/tomekz/go
export GOPATH=$GOROOT/bin
export PATH=$GOPATH:/opt/homebrew/bin:/opt/nvim-macos-arm64/bin:$HOME/.local/share/nvim/mason/bin:~/.local/bin:~/.local/kitty.app:$PATH

export OPENAI_API_KEY=xxxxxx

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
source "$HOME/.fzf.bash"
# kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'

eval "$(/opt/homebrew/bin/brew shellenv)"
