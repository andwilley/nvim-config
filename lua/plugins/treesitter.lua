return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function ()
    vim.opt.runtimepath:prepend("$HOME/.local/lib/nvim/parsers")
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      parser_install_dir = "$HOME/.local/lib/nvim/parsers",
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "]v",
          node_incremental = "]v",
          scope_incremental = "]s",
          node_decremental = "[v",
        },
      },
    })
  end,
}
