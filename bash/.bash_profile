export BASH_SILENCE_DEPRECATION_WARNING=1
export LANG=en_GB.UTF-8

# Only run on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

bind -f ~/.inputrc

[[ -s ~/.bashrc ]] && source ~/.bashrc
