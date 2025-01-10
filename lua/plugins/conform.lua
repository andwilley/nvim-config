return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function ()
        require("conform").format({ async = true })
      end,
      mode = {"v", "n"},
      desc = "Format buffer",
    },
  },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Customize formatters
    formatters = {
      lua = {},
    },
  },
}
