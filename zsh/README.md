Prerequisites:

- tools:
- [fzf](https://github.com/junegunn/fzf)
- [oh-my-zsh](https://ohmyz.sh/)
- [lazytdocker](https://github.com/jesseduffield/lazydocker)
- [lazytdocker](https://github.com/jesseduffield/lazygit)

plugins:
- [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-fzf-history-search](https://github.com/joshskidmore/zsh-fzf-history-search)

themes:
- [gruvbox](https://github.com/sbugzu/gruvbox-zsh)

aws:
- [aws-vault](https://github.com/99designs/aws-vault)
- useful script to use `aws sso login` together with `aws-vault`
```zsh
#aws sso login
function aws_login(){export AWS_VAULT=""; aws-vault exec $1 -- zsh}
_aws_login(){
    local cur=${COMP_WORDS[COMP_CWORD]}
    local options_set="$(awk '/^\[profile/ {print $2}' ~/.aws/config | sed 's/]//' | tr '\n' ' ')"
    COMPREPLY=( $(compgen -W "$options_set" -- $cur) )
}
complete -F _aws_login aws_login
```

and run it with `aws_login <profile_name>`

```zsh
#aws sso logout
function aws_logout(){aws sso logout}
```

and run it with `aws_logout`
