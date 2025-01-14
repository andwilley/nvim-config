return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      parser_install_dir = "$HOME/.local/lib/nvim/parsers",
      ensure_installed = {
        "cpp",
        "go",
        "java",
        "kotlin",
        "haskell",
        "ocaml",
        "proto",
        "rust",
        "typescript",
        "sql",
        "arduino",
        "lua",
        "vim",
        "markdown",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gv",
          node_incremental = "gn",
          scope_incremental = "gs",
          node_decremental = "gm",
        },
      },
    })
  end,
}
