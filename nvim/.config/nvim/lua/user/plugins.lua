-- //////////////////////////////////////////////
-- RUN :PackerSync to update plugins manually!!
-- //////////////////////////////////////////////
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end
    },
    git = {
        clone_timeout = 300 -- Timeout, in seconds, for git clones
    }
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use {
        "wbthomason/packer.nvim",
        commit = "6afb67460283f0e990d35d229fd38fdc04063e0a"
    } -- Have packer manage itself
    use {
        "nvim-lua/plenary.nvim",
        commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7"
    } -- Useful lua functions used by lots of plugins
    use {
        "windwp/nvim-autopairs",
        commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347"
    } -- Autopairs, integrates with both cmp and treesitter
    use {
        "numToStr/Comment.nvim",
        commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67"
    }
    use {
        "kyazdani42/nvim-web-devicons",
        commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352"
    }
    use {
        "kyazdani42/nvim-tree.lua",
        commit = "7282f7de8aedf861fe0162a559fc2b214383c51c"
    }
    use {
        "akinsho/bufferline.nvim",
        commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4"
    }
    use {
        "nvim-lualine/lualine.nvim",
        commit = "a52f078026b27694d2290e34efa61a6e4a690621"
    }
    use {
        "akinsho/toggleterm.nvim",
        commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda"
    }
    use {"github/copilot.vim"}
    use {"christoomey/vim-tmux-navigator"}
    use {"folke/which-key.nvim", commit = "0539da0"}
    use {"mbbill/undotree"}
    use {
        "epwalsh/obsidian.nvim",
        commit = "dbd81af68896a6276001dd9f65c7cb965b411338"
    }
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    }
    use {"vimwiki/vimwiki"}
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        commit = "f1168feada93c0154ede4d1fe9183bf69bac54ea",
        config = function() require("trouble").setup {} end
    }
    use {
        "ray-x/go.nvim",
        commit = "1b3a56acdd2e60518d036d44dcf53b1f00a69343",
        config = function() require("go").setup() end
    }
    use {
        "ray-x/guihua.lua",
        commit = "f755fdb1a7b4a03058a9ed8fdd6fc3f94c4f8710",
        config = function() require("go").setup() end
    }
    -- Colorschemes
    use {
        "folke/tokyonight.nvim",
        commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764"
    }
    use {
        "lunarvim/darkplus.nvim",
        commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83"
    }
    use {"morhetz/gruvbox"}

    -- cmp plugins
    use {
        "hrsh7th/nvim-cmp",
        commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc"
    } -- The completion plugin
    use {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"
    } -- buffer completions
    use {
        "hrsh7th/cmp-path",
        commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1"
    } -- path completions
    use {
        "saadparwaiz1/cmp_luasnip",
        commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"
    } -- snippet completions
    use {
        "hrsh7th/cmp-nvim-lsp",
        commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"
    }
    use {
        "hrsh7th/cmp-nvim-lua",
        commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"
    }

    -- snippets
    use {
        "L3MON4D3/LuaSnip",
        commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84"
    } -- snippet engine
    use {
        "rafamadriz/friendly-snippets",
        commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1"
    } -- a bunch of snippets to use

    -- LSP
    -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
    use {
        "neovim/nvim-lspconfig",
        commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda"
    } -- enable LSP
    use {
        "williamboman/mason.nvim",
        commit = "bfc5997e52fe9e20642704da050c415ea1d4775f"
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c"
    }
    use {"jose-elias-alvarez/null-ls.nvim"} -- for formatters and linters
    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        commit = "a0bbec2"
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        commit = "f197a15b0d1e8d555263af20add51450e5aaa1f0"
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        commit = "19a91a38b02c1c28c14e0ba468d20ae1423c39b2"
    }

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f"
    }
    use {"tpope/vim-fugitive"}
    use {"tpope/vim-surround"}
    use {
        "ThePrimeagen/git-worktree.nvim",

        config = function() require("git-worktree").setup() end
    }

    use {"MunifTanjim/nui.nvim"}

    use {"nvim-telescope/telescope-symbols.nvim"}
    use {"famiu/bufdelete.nvim"}
    use {
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup {
                predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/tomekz/dotfiles/main/nvim/.config/nvim/lua/user/chatgpt/prompts.csv",
                openai_params = {model = "gpt-4o", max_tokens = 4096}
            }
        end,
        requires = {
            "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
            "folke/trouble.nvim", "nvim-telescope/telescope.nvim"
        }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end
end)
