# Nvim config

This is my personal Neovim config. It's based on [LunarVim Launch](https://github.com/LunarVim/Launch.nvim)

Works with Neovim 0.9 and above

## Configuration

### LSP

To add a new LSP

First Enter:

```
:Mason
```

and press `i` on the Language Server you wish to install

Next you will need to add the server to this list: [servers](https://github.com/tomekz/dotfiles/blob/main/nvim/.config/nvim/lua/user/lsp/mason.lua#L1)

Note: Builtin LSP doesn't contain all lsps from [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp). In such case you need to install LSP manually

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [null-ls](https://github.com/tomekz/dotfiles/blob/main/nvim/.config/nvim/lua/user/lsp/null-ls.lua#L13)
### Plugins

You can install new plugins here: [plugins](https://github.com/tomekz/dotfiles/blob/main/nvim/.config/nvim/lua/user/plugins.lua#L48)
