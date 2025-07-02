return {
  "olimorris/codecompanion.nvim",
  opts = {},
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
  config = function ()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
      },
    })
  end,
}
