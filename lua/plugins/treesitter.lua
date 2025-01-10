return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    build = ":TSUpdate",
    parser_install_dir = "$HOME/.local/lib/nvim/parsers",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c",
          "cpp",
          "css",
          "elm",
          "haskell",
          "go",
          "kotlin",
          "ocaml",
          "proto",
          "rust",
          "ruby",
          "scala",
          "scss",
          "swift",
          "typescript",
          "sql",
          "arduino",
          "git",
          "gitignore",
          "objc",
          "lua",
          "vim",
          "query",
          "javascript",
          "html",
          "markdown",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
