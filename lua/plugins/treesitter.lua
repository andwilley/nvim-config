return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      parser_install_dir = "$HOME/.local/lib/nvim/parsers",
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "vn",
          scope_incremental = "vs",
          node_decremental = "vm",
        },
      },
    })
  end,
}
