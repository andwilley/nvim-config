return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>aia",
      "<cmd>CodeCompanionActions<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
    },
    { "<leader>aii", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, noremap = true, silent = true },
    {
      "<leader>aic",
      "<cmd>CodeCompanionChat<cr>",
      mode = { "n", "v" },
      noremap = true,
      silent = true,
    },
  },
  opts = {
    log_level = "DEBUG",
    strategies = {
      chat = {
        adapter = "gemini_cli",
      },
      inline = {
        adapter = "gemini_cli",
      },
    },
  },
}
