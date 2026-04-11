vim.opt.termguicolors = false
return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
      flavour = "mocha",
      transparent_background = true,

      term_colors = true,

      integrations = {
        treesitter = true,
        native_lsp = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "svelte",
        "go",
      })
    end,
  },

  -- Mason configs
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500, -- ms before blame appears
      },
    },
  },

  -- LSP diagnostics
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        update_in_insert = true,
      },
    },
  },
}
