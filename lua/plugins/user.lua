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
  -- Edgy.vim
  {
    "folke/edgy.nvim",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    opts = function(_, opts)
      opts.left = opts.left or {}
      table.insert(opts.left, {
        title = "Files",
        ft = "neo-tree",
        size = { width = 25 },
      })
      return opts
    end,
  },
  {
    "folke/snacks.nvim",
    keys = {
      -- Regular small terminal (bottom left)
      {
        "<leader>tt",
        function()
          Snacks.terminal(nil, {
            count = 1,
            win = {
              style = "float",
              border = "rounded",
              width = 0.4,
              height = 0.4,
              row = 0.7,
              col = 0.6,
            },
          })
        end,
        desc = "Terminal (small)",
      },
      -- Large game terminal
      {
        "<leader>tg",
        function()
          Snacks.terminal(nil, {
            count = 2,
            win = {
              style = "float",
              border = "rounded",
              width = 0.5,
              height = 0.5,
              row = 0.7,
              col = 0.6,
            },
          })
        end,
        desc = "Terminal (game)",
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
