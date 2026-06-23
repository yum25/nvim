return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        htmldjango = { "djlint" },
        njk = { "djlint" },
      },
      formatters = {
        djlint = {
          command = "djlint",
          args = { "--reformat", "--profile", "nunjucks", "-" },
          stdin = true,
        },
      },
    },
  },
}
