# prerequisites

- setup [tmux-plugin manager](https://github.com/tmux-plugins/tpm)

The purpose of this repository is to provide a centralized location for all of my dotfile configuration, making it easier for me to manage and update them as needed. It also allows me to quickly set up new machines by simply cloning this repository and copying the files over.

## Install with stow

```bash
# tmux
stow --target ~ tmux
# nvim
stow --target ~ nvim
# bash
stow --target ~ bash
# kitty
stow --target ~ kitty
```
