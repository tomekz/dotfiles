return {
  {
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    },
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      opts = {
        mappings = {
          reset = {
            normal = "<C-c>",
            insert = "<C-c>",
          },
        },
        model = "claude-3.7-sonnet",
      },
    },
  },
  {
    {
      "mfussenegger/nvim-lint",
      opts = {
        linters_by_ft = {
          markdown = {}, -- disables linting for markdown
        },
      },
    },
  },
}
