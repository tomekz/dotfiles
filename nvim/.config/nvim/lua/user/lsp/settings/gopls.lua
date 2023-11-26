return {
  settings = {
    gopls = {
      gofumpt = true,
    },
    analyses = {
      unusedparams = true,
      nilness = true,
      shadow = true,
      unusedwrite = true,
      unusedvariable = true,
    },
    staticcheck = true,
  },
}
