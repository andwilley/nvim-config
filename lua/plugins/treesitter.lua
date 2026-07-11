return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      auto_install = false,
      highlight = {
        enable = true,
      },
    })
  end,
}
