-- Use xterm-256
vim.opt.termguicolors = false

-- Keybinds
vim.keymap.set("n", "<leader>fH", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("~/Desktop"),
    hidden = true,
    find_command = {
      "fd",
      "--type",
      "f",
      "--hidden",
      "--exclude",
      ".git",
      "--exclude",
      "node_modules",
      "--exclude",
      ".cache",
    },
  })
end, { desc = "Find files in desktop directory" })

--  Transparent background override
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "catppuccin",
  callback = function()
    local groups = {
      "Normal",
      "NormalNC",
      "EndOfBuffer",
      "SignColumn",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end
  end,
})
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
        "python",
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

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
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
    opts = {
      picker = {
        hidden = true, -- for hidden files
        ignored = true, -- for .gitignore files
      },
    },
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
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      }
      return opts
    end,
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
