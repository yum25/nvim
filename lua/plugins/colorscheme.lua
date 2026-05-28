-- Use xterm-256
vim.opt.termguicolors = false

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
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load before all other plugins
    lazy = false, -- load at startup, not on demand
    opts = { ... },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
